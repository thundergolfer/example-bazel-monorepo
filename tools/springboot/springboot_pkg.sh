#!/bin/bash
#
# Copyright (c) 2017-9, salesforce.com, inc.
# All rights reserved.
# Licensed under the BSD 3-Clause license.
# For full license text, see LICENSE.txt file in the repo root  or https://opensource.org/licenses/BSD-3-Clause
#

# This script outputs a proper Spring Boot executable jar.
# This script is callable from a Bazel build (via a genrule in springboot.bzl).
# It takes a standard Bazel java_binary output executable jar and 'springboot-ifies' it.
# See springboot.bzl to see how it is invoked from the build.
# You should not be trying to invoke this file directly from your BUILD file.

# Debugging? This script outputs a lot of useful debugging information under
# /tmp/bazel/debug/springboot for each Spring Boot app.

RULEDIR=$(pwd)
SINGLEJAR_CMD=$(pwd)/$1
MAINCLASS=$2
VERIFY_DUPE=$3
JAVABASE=$4
APPJAR_NAME=$5
OUTPUTJAR=$6
APPJAR=$7
MANIFEST=$8
#GITPROPSFILE=$6

#The coverage variable is used to make sure that the correct files are picked in case bazel coverage is run with this springboot rule
COVERAGE=1

# When bazel coverage is run on packages the appcompile_rule returns an extra string
# "bazel-out/darwin-fastbuild/bin/projects/services/basic-rest-service/coverage_runtime_classpath/projects/services/basic-rest-service_app/runtime-classpath.txt"
# This is a workaround to ensure that the MANIFEST is picked correctly.

if [[ $MANIFEST = *"MANIFEST.MF" ]]; then
    GITPROPSFILE=$9
    COVERAGE=0
else
    MANIFEST=$8
    GITPROPSFILE=$10
fi

# package name (not guaranteed to be globally unique)
PACKAGENAME=$(basename $APPJAR_NAME)

# generate a package working path sha (globally unique). this allows this rule to function correctly
# if sandboxing is disabled. the wrinkle is deriving the right shasum util
shasum_output=$(shasum -h 2>/dev/null) || true
if [[ $shasum_output = *"Usage"* ]]; then
   SHASUM_INSTALL_MSG="Hashing command line utility 'shasum' will be used"
   PACKAGESHA_RAW=$(echo "$OUTPUTJAR" | shasum )
else
   # linux command is sha1sum, assume that
   PACKAGESHA_RAW=$(echo "$OUTPUTJAR" | sha1sum )
   SHASUM_INSTALL_MSG="Hashing command line utility 'sha1sum' will be used"
fi
export PACKAGESHA=$(echo "$PACKAGESHA_RAW" | cut -d " " -f 1 )

# Build time telemetry
BUILD_DATE_TIME=$(date)
BUILD_TIME_START=$SECONDS

SPRINGBOOT_RULE_TMPDIR=${TMPDIR:-/tmp}/bazel
mkdir -p $SPRINGBOOT_RULE_TMPDIR

if [ -z "${DEBUG_SPRINGBOOT_RULE}" ]; then
    DEBUGFILE=/dev/null
else
    DEBUGDIR=$SPRINGBOOT_RULE_TMPDIR/debug/springboot
    mkdir -p $DEBUGDIR
    DEBUGFILENAME=$PACKAGENAME-$PACKAGESHA
    DEBUGFILE=$DEBUGDIR/$DEBUGFILENAME.log
fi
>$DEBUGFILE

# file that will list the contents of the jar file for duplicate classes checks
CLASSLIST_FILENAME=$SPRINGBOOT_RULE_TMPDIR/$PACKAGENAME-classlist.txt
>$CLASSLIST_FILENAME

# Write debug header
echo "" >> $DEBUGFILE
echo "*************************************************************************************" >> $DEBUGFILE
echo "Build time: $BUILD_DATE_TIME"  >> $DEBUGFILE
echo "SPRING BOOT PACKAGER FOR BAZEL" >> $DEBUGFILE
echo "  RULEDIR         $RULEDIR     (build working directory)" >> $DEBUGFILE
echo "  SINGLEJAR       $SINGLEJAR_CMD (path to the singlejar utility)" >> $DEBUGFILE
echo "  MAINCLASS       $MAINCLASS   (classname of the @SpringBootApplication class for the MANIFEST.MF file entry)" >> $DEBUGFILE
echo "  OUTPUTJAR       $OUTPUTJAR   (the executable JAR that will be built from this rule)" >> $DEBUGFILE
echo "  JAVABASE        $JAVABASE    (the path to the JDK2)" >> $DEBUGFILE
echo "  APPJAR          $APPJAR      (contains the .class files for the Spring Boot application)" >> $DEBUGFILE
echo "  APPJAR_NAME     $APPJAR_NAME (unused, is the appjar filename without the .jar extension)" >> $DEBUGFILE
echo "  MANIFEST        $MANIFEST    (the location of the generated MANIFEST.MF file)" >> $DEBUGFILE
echo "  DEPLIBS         (list of upstream transitive dependencies, these will be incorporated into the jar file in BOOT-INF/lib )" >> $DEBUGFILE

# compute path to jar utility
pushd .
cd $JAVABASE/bin
JAR_COMMAND=$(pwd)/jar
popd
echo "Jar command:" >> $DEBUGFILE
echo $JAR_COMMAND >> $DEBUGFILE

if [[ $COVERAGE -eq 0 ]]; then
    i=9
else
    i=10
fi

# log the list of dep jars we were given
while [ "$i" -le "$#" ]; do
  eval "lib=\${$i}"
  echo "     DEPLIB:      $lib" >> $DEBUGFILE
  if [[ $VERIFY_DUPE == "verify" ]]; then
    # if duplicated classes protection is enabled, write the jar file path and contents to a file
    # which is later passed to the python script to analyze the contents
    echo "Jarname: $lib" >> $CLASSLIST_FILENAME
    unzip -l $lib >> $CLASSLIST_FILENAME 2>/dev/null
  fi
  i=$((i + 1))
done
echo "" >> $DEBUGFILE

# Also include the actual service code in the duplicate classes check
echo "Jarname: $OUTPUTJAR" >> $CLASSLIST_FILENAME
unzip -l $RULEDIR/$APPJAR >> $CLASSLIST_FILENAME 2>/dev/null

if [[ $VERIFY_DUPE == "verify" ]]; then
    # This python script parses the jarfile to check for duplicate classes
    python external/bazel_springboot_rule/tools/springboot/verify_conflict.py $CLASSLIST_FILENAME external/bazel_springboot_rule/tools/springboot/whitelist.txt
    returnCode=$?

    if [[ $returnCode -eq 1 ]]; then
      echo "ERROR: Failing build because of conflicting jars/classes"
      exit 1
    fi
fi

if [ -z "${DEBUG_SPRINGBOOT_RULE}" ]; then
  # cleanup, unless in debug mode: this file is only needed for the conflicting
  # classes check above
  rm -f $CLASSLIST_FILENAME
fi

echo $SHASUM_INSTALL_MSG >> $DEBUGFILE
echo "Unique identifier for this build: [$PACKAGESHA] computed from [$PACKAGESHA_RAW]" >> $DEBUGFILE

# Setup working directories. Working directory is unique to this package path (uses SHA of path)
# to tolerate non-sandboxed builds if so configured.
WORKING_DIR=$RULEDIR/$PACKAGESHA/working
echo "DEBUG: packaging working directory $WORKING_DIR" >> $DEBUGFILE
mkdir -p $WORKING_DIR/BOOT-INF/lib
mkdir -p $WORKING_DIR/BOOT-INF/classes

# Extract the compiled Boot application classes into BOOT-INF/classes
#    this must include the application's main class (annotated with @SpringBootApplication)
cd $WORKING_DIR/BOOT-INF/classes
$JAR_COMMAND -xf $RULEDIR/$APPJAR

# Copy all transitive upstream dependencies into BOOT-INF/lib
#   The dependencies are passed as arguments to the script, starting at index 5
cd $WORKING_DIR

if [[ $COVERAGE -eq 0 ]]; then
    i=10
else
    i=11
fi

while [ "$i" -le "$#" ]; do
  eval "lib=\${$i}"
  libname=$(basename $lib)
  libdir=$(dirname $lib)
  echo "DEBUG: libname: $libname" >> $DEBUGFILE
  if [[ $libname == *spring-boot-loader* ]]; then
    # if libname is prefixed with the string 'spring-boot-loader' then...
    # the Spring Boot Loader classes are special, they must be extracted at the root level /,
    #   not in BOOT-INF/lib/loader.jar nor BOOT-INF/classes/**/*.class
    # we only extract org/* since we don't want the toplevel META-INF files
    $JAR_COMMAND xf $RULEDIR/$lib org
  else
    libdestdir="BOOT-INF/lib/${libdir}"
    mkdir -p ${libdestdir}
    cp -f $RULEDIR/$lib ${libdestdir}
  fi

  i=$((i + 1))
done

ELAPSED_TRANS=$(( $SECONDS - BUILD_TIME_START ))
echo "DEBUG: finished copying transitives into BOOT-INF/lib, elapsed time (seconds): $ELAPSED_TRANS" >> $DEBUGFILE

# Inject the Git properties into a properties file in the jar
# (the -f is needed when remote caching is used, as cached files come down as r-x and
#  if you rerun the build it needs to overwrite)
echo "DEBUG: adding git.properties" >> $DEBUGFILE
cat $RULEDIR/$GITPROPSFILE >> $DEBUGFILE
cp -f $RULEDIR/$GITPROPSFILE $WORKING_DIR/BOOT-INF/classes

# Create the output jar
cd $WORKING_DIR

# write debug telemetry data
echo "DEBUG: Creating the JAR file $WORKING_DIR" >> $DEBUGFILE
echo "DEBUG: jar contents:" >> $DEBUGFILE
find . >> $DEBUGFILE
ELAPSED_PRE_JAR=$(( $SECONDS - BUILD_TIME_START ))
echo "DEBUG: elapsed time (seconds): $ELAPSED_PRE_JAR" >> $DEBUGFILE

# first use jar to create a correct jar file for Spring Boot
# Note that a critical part of this step is to pass option 0 into the jar command
# that tells jar not to compress the jar, only package it. Spring Boot does not
# allow the jar file to be compressed (it will fail at startup).
RAW_OUTPUT=$RULEDIR/${OUTPUTJAR}.raw
echo "DEBUG: Running jar command to produce $RAW_OUTPUT" >> $DEBUGFILE
$JAR_COMMAND -cfm0 $RAW_OUTPUT $RULEDIR/$MANIFEST .  2>&1 | tee -a $DEBUGFILE

# now use Bazel's singlejar to re-jar it which normalizes timestamps as Jan 1 2010
# note that it does not use the MANIFEST from the jar file, which is a bummer
# so we have to respecify the manifest data
# TODO we could rewrite the write_manfiest.sh to produce inputs compatible for singlejar
SINGLEJAR_OPTIONS="--normalize --dont_change_compression" # add in --verbose for more details from command
SINGLEJAR_MAINCLASS="--main_class org.springframework.boot.loader.JarLauncher"
$SINGLEJAR_CMD $SINGLEJAR_OPTIONS $SINGLEJAR_MAINCLASS \
    --deploy_manifest_lines "Start-Class: $MAINCLASS" \
    --sources $RAW_OUTPUT \
    --output $RULEDIR/$OUTPUTJAR 2>&1 | tee -a $DEBUGFILE

if [ $? -ne 0 ]; then
  echo "ERROR: Failed creating the JAR file $WORKING_DIR." | tee -a $DEBUGFILE
fi

cd $RULEDIR

# Elapsed build time
BUILD_TIME_END=$SECONDS
BUILD_TIME_DURATION=$(( BUILD_TIME_END - BUILD_TIME_START ))
echo "DEBUG: SpringBoot packaging subrule elapsed time (seconds) for $PACKAGENAME: $BUILD_TIME_DURATION" >> $DEBUGFILE

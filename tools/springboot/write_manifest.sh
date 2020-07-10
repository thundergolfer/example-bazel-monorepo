#!/bin/bash
#
# Copyright (c) 2017-9, salesforce.com, inc.
# All rights reserved.
# Licensed under the BSD 3-Clause license.
# For full license text, see LICENSE.txt file in the repo root  or https://opensource.org/licenses/BSD-3-Clause
#

MAINCLASS=$1
MANIFESTFILE=$2
FOUND_SPRING_JAR=0
# Looking for the springboot jar injected by springboot.bzl and extracting the version
for var in "$@"
do
  if [[ $var = *"spring-boot-"* ]]; then
    SPRING_VERSION=$(echo "$var" | rev | cut -c5- | rev | cut -d / -f 4 | cut -d - -f 3)
    FOUND_SPRING_JAR=1
    break
  fi
done

if [[ $FOUND_SPRING_JAR -ne 1 ]]; then
    echo "ERROR: //tools/springboot/write_manifest.sh could not find spring-boot jar"
    exit 1
fi

#get the java -version details
# todo this isn't the best value to use. it is the version that will be used by the jar tool
# to package the boot jar but not for compiling the code (java_toolchain)
JAVA_STRING=$(java -version 2>&1)

#get the first line of the version details and get the version
JAVA_VERSION=$(echo "$JAVA_STRING" | head -n1 | cut -d ' ' -f 3 | rev | cut -c2- | rev | cut -c2- )

echo "Manifest-Version: 1.0" > $MANIFESTFILE
echo "Created-By: Bazel" >> $MANIFESTFILE
echo "Built-By: Bazel" >> $MANIFESTFILE
echo "Main-Class: org.springframework.boot.loader.JarLauncher" >> $MANIFESTFILE
echo "Spring-Boot-Classes: BOOT-INF/classes/" >> $MANIFESTFILE
echo "Spring-Boot-Lib: BOOT-INF/lib/" >> $MANIFESTFILE
echo "Spring-Boot-Version: $SPRING_VERSION" >> $MANIFESTFILE
echo "Build-Jdk: $JAVA_VERSION" >> $MANIFESTFILE
echo "Start-Class: $MAINCLASS" >> $MANIFESTFILE

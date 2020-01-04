#!/bin/bash
#
# Copyright (c) 2017-9, salesforce.com, inc.
# All rights reserved.
# Licensed under the BSD 3-Clause license.
# For full license text, see LICENSE.txt file in the repo root  or https://opensource.org/licenses/BSD-3-Clause
#

# Inject the Git properties into a properties file in the jar.
# This matches what the Maven git-commit-id-plugin

# PERF NOTE:
# Be aware that for dev builds, we mute the git properties (build stamping) to allow many developers
#   to share cache entries for Spring Boot jars. This is a major perf optimization.
# See //tools/buildstamp/README.md for details.

# Create the properties file
GITPROPSFILE=$1
echo "# git info injected by Bazel build" > $GITPROPSFILE

RULEDIR=$(pwd)
STABLEPROPS=$RULEDIR/bazel-out/stable-status.txt
VOLATILEPROPS=$RULEDIR/bazel-out/volatile-status.txt

# BUILD ENVIRONMENT PROPERTIES
echo "" >> $GITPROPSFILE

for key in git.build.user.email git.build.host git.build.time; do
  value=$(grep $key $VOLATILEPROPS | cut -d " " -f 2-100)
  if [[ $? == 0 ]];
  then
    echo "$key=$value" >> $GITPROPSFILE
  fi
done

# BRANCH PROPERTIES
echo "" >> $GITPROPSFILE

for key in STABLE_git.branch STABLE_git.dirty STABLE_git.remote.origin.url; do
  value=$(grep $key $STABLEPROPS | cut -d " " -f 2-100)
  if [[ $? == 0 ]];
  then
    GIT_KEY=$(echo $key | cut -d '_' -f 2)
    echo "$GIT_KEY=$value" >> $GITPROPSFILE
  fi
done

# LAST COMMIT PROPERTIES
echo "" >> $GITPROPSFILE

# we do git.commit.id SHA as a one-off, because we have to change the name to match
# the git-commit-id-plugin
value=$(grep git.commit.id.sha $STABLEPROPS | cut -d " " -f 2-100)
if [[ $? == 0 ]];
then
  echo "git.commit.id=$value" >> $GITPROPSFILE
fi

for key in STABLE_git.commit.user.email STABLE_git.commit.user.name STABLE_git.commit.id.abbrev STABLE_git.commit.id.describe STABLE_git.closest.tag.name STABLE_git.commit.time STABLE_git.commit.message.short; do
  value=$(grep $key $STABLEPROPS | cut -d " " -f 2-100)
  if [[ $? == 0 ]];
  then
    GIT_KEY=$(echo $key | cut -d '_' -f 2)
    echo "$GIT_KEY=$value" >> $GITPROPSFILE
  fi
done

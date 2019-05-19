#!/usr/bin/env bash

# This script is used to set up a buildkite-agent EC2 instance so that
# it can run all steps in the C.I pipeline.
#
# You can customize your stack’s instances by using the `BootstrapScriptUrl`
# stack parameter to run a bash script on instance boot.
# Currently `BootstrapScriptUrl` is set to:  s3://buildkite-agent-scripts/bootstrap_agent.sh
#
# Upload Cmd: `aws --profile aws-2019-admin s3 cp .buildkite/bootstrap_agent.sh "s3://buildkite-agent-scripts/bootstrap_agent.sh"`

echo "Starting Buildkite agent bootstrap..."

# Can't upgrade to 0.25.2. Breaks rules_scala:
# https://github.com/bazelbuild/bazel/issues/7498#issuecomment-489286392
BAZEL_VERSION="0.24.1"

## Install Bazel's and Project's dependencies

# NOTE: Amazon Linux 2 uses 'yum' not 'apt-get'
sudo yum groupinstall -y "Development Tools"
sudo yum install -y zip unzip python
sudo yum install -y java-1.8.0-openjdk-devel

## Install Bazel from source

curl -sSL -O \
  "https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh"
chmod +x "bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh"
sudo "./bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh"


echo "Finished Buildkite agent bootstrap..."

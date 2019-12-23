#!/usr/bin/env bash

set -o errexit
set -o pipefail

# This script is used to set up a buildkite-agent EC2 instance so that
# it can run all steps in the C.I pipeline.
#
# You can customize your stack’s instances by using the `BootstrapScriptUrl`
# stack parameter to run a bash script on instance boot.
# Currently `BootstrapScriptUrl` is set to:  s3://buildkite-agent-scripts/bootstrap_agent.sh
#
# Upload Cmd: `aws --profile aws-2019-admin s3 cp .buildkite/bootstrap_agent.sh "s3://buildkite-agent-scripts/bootstrap_agent.sh"`

echo "Starting Buildkite agent bootstrap..."

BAZEL_VERSION="1.0.0"

## Install Bazel's and Project's dependencies

# NOTE: Amazon Linux 2 uses 'yum' not 'apt-get'
sudo yum groupinstall -y "Development Tools"
sudo yum install -y zip unzip
# Copied from https://github.com/buildkite/elastic-ci-stack-for-aws/pull/583/files
sudo yum install -y python3-pip python3 python3-setuptool
sudo yum install -y java-1.8.0-openjdk-devel

# Ruby
sudo yum install -y curl gpg gcc gcc-c++ make
sudo gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
sudo curl -sSL https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm install "ruby-2.6.3"
rvm use 2.6.3 --default

## Install Bazel from source

curl -sSL -O \
  "https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh"
chmod +x "bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh"
sudo "./bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh"


echo "Finished Buildkite agent bootstrap..."

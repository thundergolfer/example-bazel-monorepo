#!/usr/bin/env bash

set -o errexit
set -o pipefail

BAZEL_VERSION="2.0.0"

## Install Bazel's and Project's dependencies

# NOTE: Amazon Linux 2 uses 'yum' not 'apt-get'
sudo yum groupinstall -y "Development Tools"
sudo yum install -y zip unzip
# Copied from https://github.com/buildkite/elastic-ci-stack-for-aws/pull/583/files
sudo yum install -y python3-pip python3 python3-setuptools
sudo yum install -y java-1.8.0-openjdk-devel

# Ruby
sudo amazon-linux-extras install ruby2.6

# Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
# shellcheck disable=SC1090
. ~/.nvm/nvm.sh
nvm install node

## Install Bazel from source

curl -sSL -O \
  "https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh"
chmod +x "bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh"
sudo "./bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh"
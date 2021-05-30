#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

## Install Bazel and the other project's dependencies
main() {
  local bazel_version
  bazel_version="${BAZEL_VERSION}"

  # NOTE: Amazon Linux 2 uses 'yum' not 'apt-get'
  sudo yum groupinstall -y "Development Tools"
  sudo yum install -y zip unzip
  # Copied from https://github.com/buildkite/elastic-ci-stack-for-aws/pull/583/files
  sudo yum install -y python3-pip python3 python3-setuptools
  sudo yum install -y java-1.8.0-openjdk-devel

  # Install Node
  curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh" | bash
  # shellcheck disable=SC1090
  . ~/.nvm/nvm.sh
  nvm install node

  ## Install Bazel from source
  curl -sSL -O \
    "https://github.com/bazelbuild/bazel/releases/download/${bazel_version}/bazel-${bazel_version}-installer-linux-x86_64.sh"
  chmod +x "bazel-${bazel_version}-installer-linux-x86_64.sh"
  sudo "./bazel-${bazel_version}-installer-linux-x86_64.sh"
}

main "$@"

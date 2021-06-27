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

  sudo yum install -y zstd
  sudo yum install -y java-1.8.0-openjdk-devel

  # NOTE: Using (supposedly) hermetic Python toolchain so only need Python for https://github.com/bazelbuild/bazel/issues/8446
  #       and fortunately python2 is available in the base AMI.

  # Install Node
  curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh" | bash
  # shellcheck disable=SC1090
  . ~/.nvm/nvm.sh
  nvm install node

  ## Install Bazel
  curl -sSL -O \
    "https://github.com/bazelbuild/bazel/releases/download/${bazel_version}/bazel-${bazel_version}-installer-linux-x86_64.sh"
  chmod +x "bazel-${bazel_version}-installer-linux-x86_64.sh"
  sudo "./bazel-${bazel_version}-installer-linux-x86_64.sh"
}

main "$@"

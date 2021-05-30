#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"

main() {
  local bazel_version
  local bazelversion_dotfile_path

  bazelversion_dotfile_path="${REPO_ROOT}/.bazelversion"
  bazel_version="$(tr -d '\n' < "${bazelversion_dotfile_path}")"

  cd "${REPO_ROOT}/infrastructure/aws/ami/continuous_integration/"

  packer build \
    -var "aws_access_key=${AWS_ACCESS_KEY_ID}" \
    -var "aws_secret_key=${AWS_SECRET_ACCESS_KEY}" \
    -var "bazel_version=${bazel_version}" \
    "./packer-conf.pkr.hcl"
}


main "$@"

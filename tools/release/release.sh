#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

ARTIFACTS_BUCKET="s3://example-bazel-monorepo-artifacts"
REPO_ROOT="$(git rev-parse --show-toplevel)"

main() {
  local releaseable_targets

  aws sts get-caller-identity

  echo "${ARTIFACTS_BUCKET}/${BUILDKITE_COMMIT}"

  aws s3 ls "${ARTIFACTS_BUCKET}"

  # shellcheck disable=SC2046
  bazel build $(bazel query "attr(tags, release, //...)")

  aws s3 cp "${REPO_ROOT}/bazel-bin/store-api/src/main/java/com/book/store/api/deployable.jar" "${ARTIFACTS_BUCKET}/${BUILDKITE_COMMIT}/store-api/src/main/java/com/book/store/api/deployable.jar"
}

main "$@"
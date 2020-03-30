#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

ARTIFACTS_BUCKET="s3://example-bazel-monorepo-artifacts"
REPO_ROOT="$(git rev-parse --show-toplevel)"

main() {
  # Build all releaseable targets before attempting to copy them to S3
  # shellcheck disable=SC2046
  bazel build $(bazel query "attr(tags, release, //...)")

  # For now I'm more or less hardcoding the paths to each releaseable.
  # TODO(Jonathon): Make this work better when N=1 releaseables grows to like N=20+
  aws s3 cp "${REPO_ROOT}/bazel-bin/store-api/src/main/java/com/book/store/api/deployable.jar" "${ARTIFACTS_BUCKET}/${BUILDKITE_COMMIT}/store-api/src/main/java/com/book/store/api/deployable.jar"
}

main "$@"

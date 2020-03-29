#!/usr/bin/env bash

ARTIFACTS_BUCKET="s3://example-bazel-monorepo-artifacts"

main() {
  aws sts get-caller-identity

  echo "${ARTIFACTS_BUCKET}/${BUILDKITE_COMMIT}"

  aws s3 ls "${ARTIFACTS_BUCKET}"
}

main "$@"
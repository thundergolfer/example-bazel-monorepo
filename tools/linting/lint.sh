#!/usr/bin/env bash

# Mostly copied from https://github.com/thundergolfer/bazel-linting-system

REPO_ROOT=$(git rev-parse --show-toplevel)

set -o errexit
set -o nounset
set -o pipefail


main() {
  cd "${REPO_ROOT}"

  bazel run //:buildifier

  # TODO(Jonathon): Shouldn't buildifier support '--exclude' functionality?
  git checkout -- 3rdparty

  bazel build //... \
    --aspects //tools/linting:aspect.bzl%lint \
    --output_groups=report

  bazel run @linting_system//:apply_changes -- \
    "$(git rev-parse --show-toplevel)" \
    "$(bazel info bazel-genfiles)" \
    "$(bazel query //... | tr '\n' ' ')"
}

main "$@"

#!/usr/bin/env bash
# shellcheck disable=SC2086
# shellcheck disable=SC2090

# Mostly copied from https://github.com/thundergolfer/bazel-linting-system

REPO_ROOT=$(git rev-parse --show-toplevel)

set -o errexit
set -o nounset
set -o pipefail

# Don't stream to Build Event System it's too slow for a linting script.
BZL_FLAGS="--bes_results_url= --bes_backend="

main() {
  cd "${REPO_ROOT}"

  bazel run \
   ${BZL_FLAGS} \
   //:buildifier

  # TODO(Jonathon): Shouldn't buildifier support '--exclude' functionality?
  git checkout -- 3rdparty

  bazel build //... \
    ${BZL_FLAGS} \
    --aspects //tools/linting:aspect.bzl%lint \
    --output_groups=report

  bazel run @linting_system//:apply_changes \
    ${BZL_FLAGS} \
    -- \
    "$(git rev-parse --show-toplevel)" \
    "$(bazel info bazel-genfiles)" \
    "$(bazel query //... | tr '\n' ' ')"
}

main "$@"

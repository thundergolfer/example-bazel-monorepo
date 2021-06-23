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

  echo "Running 'build' phase of bazel-linting-system..."

  # TODO(Jonathon): Remove -3rdparty/... when I can get the linter to ignore
  # pip_compile_requirements code.
  bazel build \
    ${BZL_FLAGS} \
    --aspects //tools/linting:aspect.bzl%lint \
    --output_groups=report \
    -- \
    //... \
    -3rdparty/...


  echo "Running 'apply' phase of bazel-linting-system..."

  bazel run @linting_system//:apply_changes \
    ${BZL_FLAGS} \
    -- \
    "$(git rev-parse --show-toplevel)" \
    "$(bazel info bazel-genfiles)"
}

main "$@"

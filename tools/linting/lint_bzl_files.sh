#!/usr/bin/env bash
# shellcheck disable=SC2086
# shellcheck disable=SC2090

REPO_ROOT=$(git rev-parse --show-toplevel)

set -o errexit
set -o nounset
set -o pipefail

main() {
  cd "${REPO_ROOT}"

  echo "Linting BUILD files and WORKSPACE file..."

  bazel run \
   //:buildifier

  # TODO(Jonathon): Shouldn't buildifier support '--exclude' functionality?
  git checkout -- 3rdparty
}

main "$@"

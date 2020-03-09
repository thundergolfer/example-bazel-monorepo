#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

bazel run //:buildifier

# TODO(Jonathon): Shouldn't buildifier support '--exclude' functionality?
git checkout -- 3rdparty

if git diff --name-only | grep -vq "bazelignore";
then
  git diff
  echo "Bazel linting errors found. Run $(basename "${BASH_SOURCE}")  to lint BUILD files + WORKSPACE"
  exit 1
fi

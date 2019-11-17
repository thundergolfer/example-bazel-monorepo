#!/usr/bin/env bash

bazel run //:buildifier

# TODO(Jonathon): Shouldn't buildifier support '--exclude' functionality?
git checkout -- 3rdparty

if [[ -n $(git status -s) ]]; then
  echo "Bazel linting errors found. Run $(basename ${BASH_SOURCE})  to lint BUILD files + WORKSPACE"
  exit 1
fi

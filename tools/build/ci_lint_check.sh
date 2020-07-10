#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"

main() {
  "${REPO_ROOT}"/tools/linting/lint_bzl_files.sh
  "${REPO_ROOT}"/tools/linting/lint.sh

  if git diff --name-only | grep -vq "bazelignore";
  then
    # shellcheck disable=SC2034
    export GIT_PAGER=cat
    git diff
    echo "Bazel linting errors found. Run $(basename "${BASH_SOURCE}")  to lint BUILD files + WORKSPACE"
    exit 1
  fi
}

main

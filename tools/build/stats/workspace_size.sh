#!/usr/bin/env bash

MONOREPO_ROOT="$(git rev-parse --show-toplevel)"

main() {
  local num_packages
  local starlark_files
  local target_details

  num_packages=$(find "${MONOREPO_ROOT}/" -type f -name "BUILD" -o -name "BUILD.bazel" | wc -l)
  starlark_files=$(find "${MONOREPO_ROOT}/" -type f -name "*.bzl" | wc -l)

  target_details=$(bazel query //... --output label_kind)

  echo "REPORT"
  echo "------------------"
  echo "# Bazel packages: ${num_packages}"
  echo "# Bazel targets:  $(echo "${target_details}" | wc -l)"
  echo "# Starlark files: ${starlark_files}"
}

main "$@"

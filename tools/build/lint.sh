#!/usr/bin/env bash

# Copied from https://github.com/thundergolfer/bazel-linting-system

set -o errexit
set -o nounset
set -o pipefail

bazel build //... \
    --aspects //tools/linting:aspect.bzl%lint \
    --output_groups=report

bazel run @linting_system//:apply_changes -- \
  "$(git rev-parse --show-toplevel)" \
  "$(bazel info bazel-genfiles)" \
  "$(bazel query //... | tr '\n' ' ')"

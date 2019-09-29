#!/usr/bin/env bash

REPO_ROOT="$(git rev-parse --show-toplevel)"

bazel run @rules_pygen//:generator -- \
  "${REPO_ROOT}/tools/dependencies/python_requirements.txt" \
  "${REPO_ROOT}/3rdparty/python/requirements.bzl" \
  //3rdparty/python \
  --python=37
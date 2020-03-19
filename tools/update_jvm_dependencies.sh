#!/bin/bash

echo -ne "\033[0;32m"
echo 'Updating bazel dependencies. This will take about five minutes.'
echo -ne "\033[0m"

set -o errexit
set -o nounset
set -o pipefail

if [ "$(uname -s)" == "Linux" ]; then
  BAZEL_DEPS_URL="https://github.com/johnynek/bazel-deps/releases/download/v0.1-7/bazel-deps-linux"
  BAZEL_DEPS_SHA256="8597279f17a4cc8d49169276a6266cf1ae342e5700b995c2bd3b83128d028d31"
elif [ "$(uname -s)" == "Darwin" ]; then
  BAZEL_DEPS_URL="https://github.com/johnynek/bazel-deps/releases/download/v0.1-7/bazel-deps-macos"
  BAZEL_DEPS_SHA256="11e58b790566dbc23567faedef16d7f9177289b897fe790ffb8bbe057d06ebb8"
else
  echo "Your platform '$(uname -s)' is unsupported, sorry"
  exit 1
fi

WORKSPACE_FILEPATH="./3rdparty/jvm_workspace.bzl"
TARGET_FILE_FILEPATH="3rdparty/target_file.bzl"
DEPS_YAML_FILEPATH="./tools/dependencies/jvm_dependencies.yaml"

REPO_ROOT="$(git rev-parse --show-toplevel)"
SCRIPT_LOCATION="${REPO_ROOT}/tools/"
cd "${SCRIPT_LOCATION}"


BAZEL_DEPS_DIR="${HOME}/.bazel-deps-cache"
BAZEL_DEPS_PATH="${BAZEL_DEPS_DIR}/v0.1-7"

main() {
  if [[ ! -f "${BAZEL_DEPS_PATH}" ]]; then
      set -e
      echo "Fetching bazel deps."
      curl -L -o "/tmp/bazel-deps-bin" "${BAZEL_DEPS_URL}"

      GENERATED_SHA_256="$(shasum -a 256 /tmp/bazel-deps-bin | awk '{print $1}')"

      if [ "${GENERATED_SHA_256}" != "${BAZEL_DEPS_SHA256}" ]; then
        echo "Sha 256 does not match, expected: ${BAZEL_DEPS_SHA256}"
        echo "But found ${GENERATED_SHA_256}"
        echo "You may need to update the sha in this script, or the download was corrupted."
        exit 1
      fi

      chmod +x "/tmp/bazel-deps-bin"
      mkdir -p "${BAZEL_DEPS_DIR}"
      mv "/tmp/bazel-deps-bin" "${BAZEL_DEPS_PATH}"
  fi

  cd "${REPO_ROOT}"

  $BAZEL_DEPS_PATH generate \
    -r "${REPO_ROOT}" \
    -s "${WORKSPACE_FILEPATH}" \
    -d "${DEPS_YAML_FILEPATH}" \
    --target-file "${TARGET_FILE_FILEPATH}" \
    --disable-3rdparty-in-repo
}

main "$@"

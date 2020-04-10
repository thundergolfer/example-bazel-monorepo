#!/bin/bash

echo -ne "\033[0;32m"
echo 'Updating Rust dependencies. This should take < 2 minutes.'
echo -ne "\033[0m"

set -o errexit
set -o nounset
set -o pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
SCRIPT_LOCATION="${REPO_ROOT}/tools/"

main() {
  cd "${REPO_ROOT}/3rdparty/cargo"

  cargo raze
}

main "$@"

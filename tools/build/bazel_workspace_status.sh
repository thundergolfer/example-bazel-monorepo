#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# Bazel workspace status command: https://docs.bazel.build/versions/master/user-manual.html#flag--workspace_status_command

GIT_COMMIT=$(git rev-parse HEAD 2>/dev/null)

# Prefix with STABLE_ so that these values are saved to stable-status.txt instead of
# volatile-status.txt.
# Stamped rules will be retriggered by changes to stable-status.txt, but not by changes to
# volatile-status.txt.
cat <<EOF
STABLE_BUILD_GIT_COMMIT ${GIT_COMMIT-}
EOF


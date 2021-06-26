#!/usr/bin/env bash

set -o errexit
set -o pipefail

# This script is used to set up a buildkite-agent EC2 instance so that
# it can run all steps in the C.I pipeline.
#
# You can customize your stack’s instances by using the `BootstrapScriptUrl`
# stack parameter to run a bash script on instance boot.
# Currently `BootstrapScriptUrl` is set to:  s3://buildkite-agent-scripts/bootstrap_agent.sh
#
# Upload Cmd: `aws --profile aws-2019-admin s3 cp .buildkite/bootstrap_agent.sh "s3://buildkite-agent-scripts/bootstrap_agent.sh"`

echo "Starting Buildkite agent bootstrap..."

echo "Nothing to do."

echo "Finished Buildkite agent bootstrap..."

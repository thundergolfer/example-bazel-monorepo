## Continuous Integration

> This is more just continous build & test, not full C.I

### Re-Building AMI

Run `./rebuild.sh` with AWS keys set as env vars to rebuild an AMI for CI. 
It's currently a manual step for me to update CI's CloudFormation stack with the new AMI ID.

The Buildkite agent instance is defined by this AMI base image and the `bootstrap_agent.sh` script.
The agent instance needs to be kept in sync with certain changes in the repository, most commonly the 
Bazel version.

### Debugging an AMI

**Connecting to an instance running the AMI**

```bash
ssh -i "$HOME/Downloads/jun2021keypair_2.pem" ec2-user@ec2-18-217-105-23.us-east-2.compute.amazonaws.com
```

The repo is public on Github so just push up changes on a branch and
`git clone https://github.com/thundergolfer/example-bazel-monorepo.git` when on the instance.

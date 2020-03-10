TODO(Jonathon): The C.I runs in `us-east-2` (Ohio) which is annoying. Need to fix that eventually.

Run `./rebuild.sh` with AWS keys set as env vars to rebuild an AMI for CI. 
It's currently a manual step for me to update CI's CloudFormation stack with the new AMI ID.

#### Debugging an AMI

**Connecting to an instance running the AMI**

```
ssh -i "$HOME/Downloads/adhoc-11mar2020.pem" ec2-user@ec2-18-217-105-23.us-east-2.compute.amazonaws.com
```

The repo is public on Github so just push up changes on a branch and `git clone https://github.com/thundergolfer/example-bazel-monorepo.git` when on the instance.
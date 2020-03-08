The C.I runs in `us-east-2` (Ohio) which is annoying. Need to fix that eventually.

Run `./rebuild.sh` with AWS keys set as env vars to rebuild an AMI for CI. 
It's currently a manual step for me to update CI's CloudFormation stack with the new AMI ID. 
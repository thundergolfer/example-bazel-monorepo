terraform {
  required_version = "0.12.18"
}

variable "region" {
  type = string
}

variable "environment" {
  type = string
}

variable "domain_name" {
  type = string
}

provider "aws" {
  region = var.region

}

// TODO(Jonathon): Move the massive instance-userdata variable into a Terraform .tpl file
locals {
  foo = "bar"
  instance-userdata = <<EOF
#!/bin/bash
# This should be copied into the store-api.tf locals after updating.

set -o nounset
set -o pipefail

RELEASE_BUCKET="s3://example-bazel-monorepo-artifacts"
USER="root" # userdata runs as 'root' user

apt-get -y update

# Install Java Runtime Environment (JRE 11)
apt-get -y install default-jdk
# Install Postgres
apt-get -y install postgresql postgresql-contrib
# Install AWS CLI
apt -y install awscli

# Setup DB
sudo -u postgres createuser -s $USER

createdb bookstore_api

# ⚠️ This is terrible security, but it will have to do for now. There's nothing of value in the DB.
# Trust all local connections, not requiring password. Avoids the following:
# 'org.postgresql.util.PSQLException: The server requested password-based authentication, but no password was provided.'
sudo -u postgres sed -i 's/host    all             all             127.0.0.1\/32            md5/host    all             all             127.0.0.1\/32            trust/g' /etc/postgresql/10/main/pg_hba.conf
service postgresql reload

aws s3 cp "$RELEASE_BUCKET/4f2f87949d9ce6f40617268d25dd6ed6d9a8f417/store-api/src/main/java/com/book/store/api/deployable.jar" "."

# Run jar, adding '&' to run in background
java -jar "./deployable.jar" &
# The API will be available @ something like http://{EC2 Public DNS}:8080, eg. http://ec2-3-15-180-230.us-east-2.compute.amazonaws.com:8080

EOF
}

data "aws_partition" "current" {}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

// TODO(Jonathon): Add permissions for this role to read from build artifacts bucket, so that it can copy jar down in userdata step
resource "aws_iam_role" "store_api" {
  name = "store-api"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_instance_profile" "store_api" {
  name = "store-api"
  role = aws_iam_role.store_api.name
}

// TODO(Jonathon): Set up security group for this so that I can connect over SSH and any internet browser can connect on port 8080
resource "aws_instance" "store_api" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.nano"
  iam_instance_profile = "store-api"
  key_name = "store-api" // Note: Created outside of Terraform using AWS Console

  user_data_base64 = base64encode(local.instance-userdata)

  tags = {
    Name = "store-api"
  }
}

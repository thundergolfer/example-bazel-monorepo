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

locals {
  foo = "bar"
  instance-userdata = <<EOF
#!/bin/bash
# This should be copied into the store-api.tf locals after updating.

# Install Java Runtime Environment (JRE 11)
sudo apt install default-jdk
# Install Postgres
sudo apt-get install postgresql postgresql-contrib
# Setup DB
sudo su - postgres
createuser -s ubuntu
su - ubuntu
createdb bookstore_api

# ⚠️ This is terrible security, but it will have to do for now. There's nothing of value in the DB.
sudo su - postgres
# Trust all local connections, not requiring password. Avoids the following:
# 'org.postgresql.util.PSQLException: The server requested password-based authentication, but no password was provided.'
sed -i 's/host    all             all             127.0.0.1\/32            md5/host    all             all             127.0.0.1\/32            trust/g' /etc/postgresql/10/main/pg_hba.conf
sudo service postgresql reload

su - ubuntu
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

// TODO(Jonathon): Set up security group for this so that I can connect over SSH
resource "aws_instance" "store_api" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.nano"
  key_name = "store-api" // Note: Created outside of Terraform using AWS Console

  user_data_base64 = base64encode(local.instance-userdata)

  tags = {
    Name = "store-api"
  }
}

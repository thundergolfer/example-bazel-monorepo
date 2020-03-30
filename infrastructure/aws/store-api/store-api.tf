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
  user_data = templatefile("${path.module}/userdata.tpl", {})

  tags = {
    Name = "store-api"
  }
}

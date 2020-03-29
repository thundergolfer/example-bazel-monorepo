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
  instance_type = "t2.micro"
  key_name = "store-api" // Note: Created outside of Terraform using AWS Console

  tags = {
    Name = "store-api"
  }
}

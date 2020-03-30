terraform {
  required_version = "0.12.18"
}

variable "region" {
  type = string
}

variable "environment" {
  type = string
}

provider "aws" {
  region = var.region
}

locals {
  foo = "bar"
}

resource "aws_s3_bucket" "artifacts" {
  bucket = "example-bazel-monorepo-artifacts"
}

output "artifacts_bucket_arn" {
  value = aws_s3_bucket.artifacts.arn
}
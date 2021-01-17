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

locals {}

resource "aws_s3_bucket" "artifacts" {
  bucket = "example-bazel-monorepo-artifacts"

  lifecycle_rule {
    id = "intelligent-tiering"
    enabled = true
    transition {
      storage_class = "INTELLIGENT_TIERING"
    }
  }
}

output "artifacts_bucket_arn" {
  value = aws_s3_bucket.artifacts.arn
}

variable "region" {}

variable "environment" {}

variable "domain_name" {}

provider "aws" {
  region = var.region
}

resource "aws_acm_certificate" "wildcard" {
  domain_name       = "*.${var.domain_name}"
  validation_method = "DNS"

  tags = {
    Name = "${var.environment}.wildcard",
  }

  lifecycle {
    create_before_destroy = true
  }
}

// ###############
// OUTPUTS
// ###############

output "wildcard_cert_arn" {
  value = aws_acm_certificate.wildcard.arn
}
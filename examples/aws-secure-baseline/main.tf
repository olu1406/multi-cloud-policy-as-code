terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.20.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "s3_secure" {
  source = "../../modules/aws/s3-secure"
  name   = "secure-baseline-bucket"
  tags = {
    environment = "demo"
    owner       = "security"
  }
}

module "cloudtrail" {
  source      = "../../modules/aws/cloudtrail-org"
  name        = "org-trail"
  bucket_name = "cloudtrail-logs-bucket"
  tags = {
    environment = "demo"
    owner       = "security"
  }
}

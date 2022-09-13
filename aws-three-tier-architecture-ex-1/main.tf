terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.26.0"
    }
  }

  required_version = ">= 1.2.7"
}

provider "aws" {
  region = local.region
}

locals {
  region = var.regions["DUB"]
  az1    = "${local.region}a"
  az2    = "${local.region}b"
}
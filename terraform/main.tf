terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "clarity-software-projects-tf-state"
    key    = "clarity-web/terraform.tfstate"
    region = "eu-west-2"
  }
}

provider "aws" {
  region = "eu-west-2"
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

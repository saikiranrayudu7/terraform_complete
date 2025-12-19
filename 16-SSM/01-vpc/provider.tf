terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.25.0"
    }
  }
  backend "s3" {
    bucket         = "terraform-remote-stateee"
    key            = "ssm-01-vpc"
    region         = "us-east-1"
    dynamodb_table = "terraform-locking"
  }
}

provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket         = "terraform-remote-stateee"
    key            = "workspace"
    region         = "us-east-1"
    dynamodb_table = "terraform-locking"
  }
}

provider "aws" {
  region = "us-east-1"
}

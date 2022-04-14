terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    encrypt = true
    bucket  = "dijam-vps-state-new-account"
    key     = "vps-state/terraform.tfstate"
    region  = "us-west-2"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-2"
}
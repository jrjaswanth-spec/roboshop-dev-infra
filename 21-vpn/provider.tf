terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.16.0"
    }
  }

  backend "s3" {
    bucket = "trfm-remote-dev-state86s"
    key    = "roboshop-dev-vpn"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "trfm-remote-dev-state86s"
    key    = "roboshop-dev-sg"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
  }
}




provider "aws" {
  region = "us-east-1"
}
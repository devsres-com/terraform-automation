terraform {

  backend "remote" {
    organization = "devsres"
    workspaces {
      name = "github-actions"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.54.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "bucket_name" {
  type = string
}

resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name
  acl    = "private"
}

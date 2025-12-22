provider "aws" {
  region  = var.region
  profile = var.profile 
  default_tags {
    tags ={
    client = "prj1"
    env     = "dev"
    project = "prj1"
    created_by = "Terraform"
  }
  }
}
data "aws_caller_identity" "current" {}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.55.0"
    }
  }


  backend "s3" {
    bucket = "tf-state-01"
    key    = "statefile"
    region = "ap-south-1"
  }
}


terraform {
  required_version = ">= 1.10"

  backend "s3" {
    bucket       = "eks-memos-tfstate-313549093322"
    key          = "eks-lab/terraform.tfstate"
    region       = "eu-west-2"
    encrypt      = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}
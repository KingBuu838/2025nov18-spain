terraform {
    required_version = ">= 1.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.19.0"
    }
  }
}

provider "aws" {
  # Configuration options

  region = "eu-south-2"

  default_tags {
    tags = {
      Project     = "Terraform"
      Environment = "Homebase"
    }
  }
}
## Terraform block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Provider Block
provider "aws" {
  region = local.aws_region
}


locals {
  aws_region    = "us-east-1"
  instance_type = "t2.micro"
  key_name      = "terraform"

  vpc_id    = "2560-dev-alpha1-vpc"
  subnet_id = "2560-dev-alpha1-vpc-public-subnet-01"

  common_tags = {
    "AssetID"       = "2560"
    "AssetName"     = "Insfrastructure"
    "Teams"         = "DEL"
    "Environment"   = "dev"
    "Project"       = "alpha"
    "CreateBy"      = "Terraform"
    "cloudProvider" = "aws"
  }
}

module "bastion-host" {
  source        = "../../../modules/bastion-host"
  aws_region    = local.aws_region
  instance_type = local.instance_type
  key_name      = local.key_name
  vpc_id        = local.vpc_id
  subnet_id     = local.subnet_id

  common_tags = local.common_tags
}

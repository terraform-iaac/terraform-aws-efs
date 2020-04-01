provider "aws" {
  region  = "us-east-1"
}

module "vpc" {
  source = "../../terraform_aws_vpc"
  app_name = "rfs-test"
  region = "us-east-1"
  vpc_cidr = "10.10.0.0/16"
}

module "nfs" {
  source = "../"
  subnet_ids = module.vpc.private_subnet_ids
  vpc_id = module.vpc.id
}
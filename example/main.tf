module "efs" {
  source = "../"

  name           = "data-files"
  vpc_id         = module.vpc.vpc_id
  subnet_ids     = module.vpc.private_subnets
  env_name       = var.env_name
  whitelist_cidr = []
  whitelist_sg   = ["sg-12315315123"]
}
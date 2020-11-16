module "nfs" {
  source = "../"


  name = "media"
  subnet_ids = module.vpc.private_subnets
  vpc_id = module.vpc.vpc_id

  whitelist_cidr = ["1.1.1.1/32", "2.2.2.2/32"] // Optional
  whitelist_sg = ["sg-123123123", "sg-1231279471823"] // Optional
}
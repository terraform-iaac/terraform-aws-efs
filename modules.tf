module "nfs_sg" {
  source = "./module/security_group"
  vpc_id = var.vpc_id
  sg_name = var.efs_name
}
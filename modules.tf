module "nfs_sg" {
  source = "../../modules/security_group/nfs"
  vpc_id = var.vpc_id
  sg_name = var.efs_name
}
output "efs_id" {
  value = aws_efs_file_system.efs_storage.id
}
output "efs_endpoint" {
  value = aws_efs_file_system.efs_storage.dns_name
}
output "sg_id" {
  value = aws_security_group.nfs_sg.id
}
output "efs_arn" {
  value = aws_efs_file_system.efs_storage.arn
}
output "sg_whitelist" {
  value = var.whitelist_sg
}
output "cidr_whitelist" {
  value = var.whitelist_cidr
}
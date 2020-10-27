output "efs_id" {
  value = aws_efs_file_system.efs_storage.id
}
output "efs_endpoint" {
  value = aws_efs_file_system.efs_storage.dns_name
}
output "efs_arn" {
  value = aws_efs_file_system.efs_storage.arn
}
output "sg_id" {
  value = module.nfs_sg.id
}
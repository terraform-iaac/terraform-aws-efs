
resource "aws_efs_file_system" "efs_storage" {
  creation_token = "${var.efs_name}-efs"
  performance_mode = "generalPurpose"
  throughput_mode = "bursting"
  encrypted = "true"

  tags = {
    Name = var.efs_name
  }
}

resource "aws_efs_mount_target" "efs_storage_mount_target" {
  count = length(var.subnet_ids)
  file_system_id = aws_efs_file_system.efs_storage.id
  subnet_id = var.subnet_ids[count.index]
  security_groups = [
    module.nfs_sg.id]
}
# Create EFS
resource "aws_efs_file_system" "efs_storage" {
  creation_token   = "${var.name}-efs"
  performance_mode = var.performance_mode_mode
  throughput_mode  = var.throughput_mode
  encrypted        = var.encrypted

  tags = {
    Name = var.name
    Env  = var.env_name
  }
}

# Create Mount Targets for EFS
resource "aws_efs_mount_target" "efs_storage_mount_target" {
  count = length(var.subnet_ids)

  file_system_id  = aws_efs_file_system.efs_storage.id
  subnet_id       = var.subnet_ids[count.index]
  security_groups = [aws_security_group.nfs_sg.id]
}

# Create SG for EFS
resource "aws_security_group" "nfs_sg" {
  name   = "${var.name}-sg"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.create_sg_rules ? var.whitelist_cidr : []
    content {
      cidr_blocks = var.whitelist_cidr
      from_port   = local.port
      to_port     = local.port
      protocol    = "tcp"
    }
  }
  dynamic "egress" {
    for_each = var.create_sg_rules ? var.whitelist_cidr : []
    content {
      cidr_blocks = var.whitelist_cidr
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
    }
  }

  dynamic "ingress" {
    for_each = var.create_sg_rules ? var.whitelist_sg : []
    content {
      security_groups = var.whitelist_sg
      from_port       = local.port
      to_port         = local.port
      protocol        = "tcp"
    }
  }
  dynamic "egress" {
    for_each = var.create_sg_rules ? var.whitelist_sg : []
    content {
      security_groups = var.whitelist_sg
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
    }
  }

  tags = {
    Name = var.name
    Env  = var.env_name
  }
}

resource "aws_efs_access_point" "permissions" {
  count = var.create_efs_ap ? 1 : 0

  file_system_id = aws_efs_file_system.efs_storage.id
  root_directory {
    path = "/"
    creation_info {
      owner_gid   = var.owner_gid
      owner_uid   = var.owner_uid
      permissions = var.root_permissions
    }
  }

  tags = {
    Name = var.name
    Env  = var.env_name
  }
}
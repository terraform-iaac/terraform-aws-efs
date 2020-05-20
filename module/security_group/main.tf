resource "aws_security_group" "nfs_sg" {
  name = "${var.sg_name}-sg"
  vpc_id = var.vpc_id

  // NFS
  ingress {
    cidr_blocks = var.cidr_block
    from_port = 2049
    to_port = 2049
    protocol = "tcp"
  }

  // Terraform removes the default rule
  egress {
    cidr_blocks = var.cidr_block
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
}
variable "name" {
  description = "Name for SG, EFS"
  type        = string
}

# EFS
variable "performance_mode_mode" {
  description = "The file system performance mode"
  type        = string
  default     = "generalPurpose"
}
variable "throughput_mode" {
  description = "Throughput mode for the file system"
  type        = string
  default     = "bursting"
}
variable "encrypted" {
  description = "If true, the disk will be encrypted"
  default     = true
}

# Add permissions to root directory EFS
variable "root_permissions" {
  type = string
  default = "0777"
}
variable "owner_gid" {
  description = "Specifies the POSIX group ID to apply to the root_directory"
  type = number
  default = 0
}
variable "owner_uid" {
  description = "Specifies the POSIX user ID to apply to the root_directory"
  type = number
  default = 0
}

# VPC
variable "vpc_id" {
  description = "VPC where subnets locates"
  type        = string
}
variable "subnet_ids" {
  description = "VPC Subnets for mount points"
  type        = list(string)
}

# Whitelist
variable "whitelist_cidr" {
  description = "List of CIDR blocks for whitelist"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
variable "whitelist_sg" {
  description = "List of Security Groups Block for whitelist"
  type        = list(string)
  default     = []
}

# Rules
variable "create_sg_rules" {
  description = "Create default rules with SG & CIDR"
  type        = bool
  default     = true
}
variable "create_efs_ap" {
  description = "Create custom permissions to root of EFS"
  type = bool
  default = false
}

# Tags
variable "env_name" {
  description = "Tag with key Env"
  type = string
  default     = "base"
}
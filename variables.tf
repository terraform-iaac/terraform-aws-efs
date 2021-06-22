variable "name" {
  description = "Name for SG, EFS"
  type        = string
}
# Tags
variable "env_name" {
  description = "Value for Env Tag"
  type        = string
  default     = "base"
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
  default     = []
}
variable "whitelist_sg" {
  description = "List of Security Groups Block for whitelist"
  type        = list(string)
  default     = []
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
variable "provisioned_throughput_in_mibps" {
  description = "The throughput, measured in MiB/s, that you want to provision for the file system. Only applicable with throughput_mode set to provisioned"
  type        = string
  default     = null
}
variable "encrypted" {
  description = "If true, the disk will be encrypted"
  type        = bool
  default     = true
}
variable "kms_key_id" {
  description = "The ARN for the KMS encryption key. When specifying kms_key_id, encrypted needs to be set to true"
  type        = string
  default     = null
}

# Rules
variable "create_efs_ap" {
  description = "Create custom permissions to root of EFS"
  type        = bool
  default     = false
}

# Add permissions to root directory EFS
variable "root_permissions" {
  type    = string
  default = "0777"
}
variable "owner_gid" {
  description = "Specifies the POSIX group ID to apply to the root_directory"
  type        = number
  default     = 0
}
variable "owner_uid" {
  description = "Specifies the POSIX user ID to apply to the root_directory"
  type        = number
  default     = 0
}
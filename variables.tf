variable "name" {
  description = "Name for SG, EFS"
  type        = string
}
# Tags
variable "tags" {
  description = "AWS tags"
  default     = {}
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
variable "lifecycle_policy" {
  description = "A file system lifecycle policy object with optional transition_to_ia and transition_to_primary_storage_class"
  type        = map(string)
  default     = {}

  validation {
    condition = length(setsubtract(keys(var.lifecycle_policy), [
      "transition_to_ia", "transition_to_primary_storage_class"
      ])) == 0 && length(distinct(concat([
        "AFTER_7_DAYS", "AFTER_14_DAYS", "AFTER_30_DAYS", "AFTER_60_DAYS", "AFTER_90_DAYS"
        ], compact([lookup(var.lifecycle_policy, "transition_to_ia", null)])))) == 5 && length(distinct(concat([
        "AFTER_1_ACCESS"
    ], compact([lookup(var.lifecycle_policy, "transition_to_primary_storage_class", null)])))) == 1
    error_message = "Lifecycle Policy variable map contains invalid key-value arguments."
  }
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
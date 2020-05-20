variable "vpc_id" {
}

variable "subnet_ids" {
}

variable "whitelist_cidr" {
  description = "List of CIDR blocks."
  default = ["0.0.0.0/0"]
}

variable "efs_name" {
  default = "default"
}
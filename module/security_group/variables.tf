variable "vpc_id" {
  description = "The VPC ID."
}

variable "sg_name" {
  description = "The name of the security group. If omitted, Terraform will assign a random, unique name"
}

variable "cidr_block" {
  default = [
    "0.0.0.0/0"]
  description = "List of CIDR blocks."
}
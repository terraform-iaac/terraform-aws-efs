Terraform module for AWS EFS Service
==========================================

Terraform module used to create AWS EFS. With simple syntax.

## Usage

```terraform
module "ec2" {
  source = "terraform-iaac/terraform-aws-efs/aws"

  name           = "data-files"
  vpc_id         = module.vpc.vpc_id
  subnet_ids     = module.vpc.private_subnets
  env_name       = var.env_name
  whitelist_cidr = ["10.10.10.2", "10.10.10.200"]
  whitelist_sg   = ["sg-12315315123"]
}

```

## Terraform Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14.0 |
| aws | >= 3.0.0 |

## Inputs

| Name | Description | Type | Default |  Required |
|------|-------------|------|---------|:--------:|
| name  | Prefix name for SG, EFS | `string` | n/a | yes |
| env\_name  | Value for `Env` Tag | `string` | `base` | no |
| vpc\_id | VPC ID will be used by EFS | `string` | n/a | yes |
| subnet\_ids | VPC Subnet IDs where efs mount target will be created | `list(string)` | n/a |  yes |
| whitelist\_cidr | IP CIDRs to whitelist access for EFS  | `list(string)` | `[]` | no |
| whitelist\_sg | Security Group IDs to whitelist access for EFS | `list(string)` | `[]` | yes |
| performance\_mode\_mode | The file system performance mode. Can be either "generalPurpose" or "maxIO" | `string` | `generalPurpose` | no |
| throughput\_mode | Throughput mode for the file system. Valid values: bursting, provisioned. When using provisioned, also set provisioned_throughput_in_mibps | `string` | `bursting` | no |
| provisioned\_throughput\_in\_mibps | The throughput, measured in MiB/s, that you want to provision for the file system. Only applicable with throughput_mode set to provisioned | `string` | n/a | no |
| encrypted | `If true, the disk will be encrypted` | `string` | `true` | no |
| kms\_key\_id | The ARN for the KMS encryption key. When specifying kms_key_id, encrypted needs to be set to true | `string` | n/a | no |

## Outputs
| Name | Description |
|------|:-----------:|
| efs\_id | The ID that identifies the file system (e.g. fs-ccfc0d65) |
| efs\_endpoint | The DNS name for the filesystem |
| sg\_id | Security Group ID which attached for EFS |
| efs\_arn | Amazon Resource Name of the file system |
| sg\_whitelist | Security Group IDs which have access to EFS |
| cidr\_whitelist | IP CIDR Blocks which have access to EFS |
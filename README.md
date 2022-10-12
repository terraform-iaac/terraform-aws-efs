Terraform module for AWS EFS Service
==========================================

Terraform module used to create AWS EFS. With simple syntax.

## Usage

**NOTE:** You should add `whitelist_cidr` or `whitelist_sg` option, becuase by default module doesn't create any security group rules, thus EFS has restricted access.

**Example of usage:**
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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_efs_access_point.permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_access_point) | resource |
| [aws_efs_file_system.efs_storage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_file_system) | resource |
| [aws_efs_mount_target.efs_storage_mount_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_mount_target) | resource |
| [aws_security_group.nfs_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_efs_ap"></a> [create\_efs\_ap](#input\_create\_efs\_ap) | Create custom permissions to root of EFS | `bool` | `false` | no |
| <a name="input_encrypted"></a> [encrypted](#input\_encrypted) | If true, the disk will be encrypted | `bool` | `true` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The ARN for the KMS encryption key. When specifying kms\_key\_id, encrypted needs to be set to true | `string` | `null` | no |
| <a name="input_lifecycle_policy"></a> [lifecycle\_policy](#input\_lifecycle\_policy) | A file system lifecycle policy object with optional transition\_to\_ia and transition\_to\_primary\_storage\_class | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for SG, EFS | `string` | n/a | yes |
| <a name="input_owner_gid"></a> [owner\_gid](#input\_owner\_gid) | Specifies the POSIX group ID to apply to the root\_directory | `number` | `0` | no |
| <a name="input_owner_uid"></a> [owner\_uid](#input\_owner\_uid) | Specifies the POSIX user ID to apply to the root\_directory | `number` | `0` | no |
| <a name="input_performance_mode_mode"></a> [performance\_mode\_mode](#input\_performance\_mode\_mode) | The file system performance mode | `string` | `"generalPurpose"` | no |
| <a name="input_provisioned_throughput_in_mibps"></a> [provisioned\_throughput\_in\_mibps](#input\_provisioned\_throughput\_in\_mibps) | The throughput, measured in MiB/s, that you want to provision for the file system. Only applicable with throughput\_mode set to provisioned | `string` | `null` | no |
| <a name="input_root_permissions"></a> [root\_permissions](#input\_root\_permissions) | Add permissions to root directory EFS | `string` | `"0777"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | VPC Subnets for mount points | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | AWS tags | `map` | `{}` | no |
| <a name="input_throughput_mode"></a> [throughput\_mode](#input\_throughput\_mode) | Throughput mode for the file system | `string` | `"bursting"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC where subnets locates | `string` | n/a | yes |
| <a name="input_whitelist_cidr"></a> [whitelist\_cidr](#input\_whitelist\_cidr) | List of CIDR blocks for whitelist | `list(string)` | `[]` | no |
| <a name="input_whitelist_sg"></a> [whitelist\_sg](#input\_whitelist\_sg) | List of Security Groups Block for whitelist | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cidr_whitelist"></a> [cidr\_whitelist](#output\_cidr\_whitelist) | n/a |
| <a name="output_efs_arn"></a> [efs\_arn](#output\_efs\_arn) | n/a |
| <a name="output_efs_endpoint"></a> [efs\_endpoint](#output\_efs\_endpoint) | n/a |
| <a name="output_efs_id"></a> [efs\_id](#output\_efs\_id) | n/a |
| <a name="output_sg_id"></a> [sg\_id](#output\_sg\_id) | n/a |
| <a name="output_sg_whitelist"></a> [sg\_whitelist](#output\_sg\_whitelist) | n/a |
<!-- END_TF_DOCS -->
# aws-subnet

---

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

---

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_m_app_name"></a> [m\_app\_name](#input\_m\_app\_name) | The name of the application which requires this module-specific service | `string` | n/a | yes |
| <a name="input_m_availability_zone"></a> [m\_availability\_zone](#input\_m\_availability\_zone) | The AZ for the subnet. (example eu-central-1a) | `string` | n/a | yes |
| <a name="input_m_cidr_block"></a> [m\_cidr\_block](#input\_m\_cidr\_block) | CIDR block for the subnet | `string` | n/a | yes |
| <a name="input_m_environment_tag"></a> [m\_environment\_tag](#input\_m\_environment\_tag) | The environment name to be used while tagging the provisioned resources. The list of possible values are as follows:<br>- `dev` for development environment<br>- `stg` for staging or pre-production environment<br>- `prd` for production environment<br><br>Defaults to `dev` (for development environment) if no value is specified. | `string` | `"dev"` | no |
| <a name="input_m_map_public_ip_on_launch"></a> [m\_map\_public\_ip\_on\_launch](#input\_m\_map\_public\_ip\_on\_launch) | If set to `true`, network interfaces created in this subnet will have public IP assigned by default<br>If set to `false`, network interfaces created in this subnet will not have public IP assigned by default<br><br>Defaults to `false` if no value is specified. | `bool` | `false` | no |
| <a name="input_m_vpc_id"></a> [m\_vpc\_id](#input\_m\_vpc\_id) | The VPC id to deploy the new subnet in | `string` | n/a | yes |

---

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_arn"></a> [subnet\_arn](#output\_subnet\_arn) | The ARN of the subnet |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | The ID of the subnet |

---

## Examples

```hcl
module "subnet" {
  source = "..//"

  m_app_name = "vpc-etrz-dev-public-eu-west-1c"

  m_vpc_id            = "10.240.122.2"
  m_cidr_block        = "10.240.122.0/23"
  m_availability_zone = "eu-west-1c"
  m_subnet_label      = "subnet_label"
  m_tags = {
    Application = "etr-sam"
    AppDomain   = "subnet"
    Environment = "dev"
  }
}

```

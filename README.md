# terraform-aws-template

[![Lint Status](https://github.com/tothenew/terraform-aws-template/workflows/Lint/badge.svg)](https://github.com/tothenew/terraform-aws-template/actions)
[![LICENSE](https://img.shields.io/github/license/tothenew/terraform-aws-template)](https://github.com/tothenew/terraform-aws-template/blob/master/LICENSE)

This is a template to use for baseline. The default actions will provide updates for section bitween Requirements and Outputs.

The following content needed to be created and managed:
 - Introduction
     - Explaination of module 
     - Intended users
 - Resource created and managed by this module
 - Example Usages

<!-- BEGIN_TF_DOCS -->
Introduction
Explaination of module
Intended users
Resource created and managed by this module
Example Usages
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.72 |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.visulization](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.ssh_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_security_group.visulization_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [tls_private_key.ssh_private_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [template_file.userdata](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_elasticsearch_endpoint"></a> [elasticsearch\_endpoint](#input\_elasticsearch\_endpoint) | This defines Elasticsearch Endpoint so that Kibana can connect with it | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | This defines the Environment Tag | `string` | `""` | no |
| <a name="input_instance_type_visulization"></a> [instance\_type\_visulization](#input\_instance\_type\_visulization) | This defines Visulization (Grafana + Kibana) Instance Size/Type | `string` | `""` | no |
| <a name="input_pem_key_name"></a> [pem\_key\_name](#input\_pem\_key\_name) | This defines Pem Key Name | `string` | `""` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | This defines Visulization (Grafana + Kibana) Instance VPC Subnet ID | `string` | `""` | no |
| <a name="input_volume_size_visulization"></a> [volume\_size\_visulization](#input\_volume\_size\_visulization) | This defines Visulization (Grafana + Kibana) Instance Root Volume Size | `number` | `"30"` | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | This defines Visulization (Grafana + Kibana) Instance VPC CIDR Block | `string` | `""` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | This defines Visulization (Grafana + Kibana) Instance VPC ID | `string` | `""` | no |

## Outputs
<!-- END_TF_DOCS -->
| Name | Description |
|------|-------------|
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | n/a |

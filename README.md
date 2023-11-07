# terraform-aws-network-load-balancer

## Summary

This Terraform module creates AWS Network Load Balancer (NLB) resources along with associated listeners and target groups. The NLB is designed to handle millions of requests per second while maintaining ultra-low latencies, making it ideal for handling volatile workloads and traffic patterns.

Network Load Balancers are best suited for load balancing TCP traffic where extreme performance is required. Operating at the connection level (Layer 4), Network Load Balancers route traffic to targets within Amazon VPC and are capable of handling millions of requests per second while maintaining high throughput at ultra-low latencies.

## Helpful AWS Documentation Links

- [What is Elastic Load Balancing?](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/introduction.html)
- [Network Load Balancers](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/network-load-balancers.html)
- [Create a Network Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-network-load-balancer.html)

## Example Usage

```hcl
provider "aws" {
  region = "us-west-2"
}

module "network_load_balancer" {
  source = "./path_to_module"

  region = "us-west-2"
  subnet_ids = ["subnet-0bb1c79de3EXAMPLE", "subnet-0bb1c79de3EXAMPLE", "subnet-0bb1c79de3EXAMPLE"]
  vpc_id = "vpc-0bb1c79de3EXAMPLE"

  nlb_name = "my-nlb"
  internal = false
  enable_deletion_protection = false
  enable_cross_zone_load_balancing = true

  listener_port = 80
  target_group_name = "my-target-group"
  target_group_port = 80
}
```

Replace `path_to_this_module` with the path to where you have this module.

## Tags

To configure any additional tags, set tags map in module definition

```hcl

module "security_group" {
  source = "path_to_this_module"

  ...

  tags = {
    Owner       = "team-name"
    Environment = "development"
  }
}

```

## Examples

* [SG](./examples/nlb)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=4.28 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >=4.28 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_network_load_balancer.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_load_balancer) | resource |
| [aws_lb_listener.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region"></a> [region](#input_region) | The default region for the test. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_contact"></a> [contact](#input_contact) | (Required) The contact for this resource. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input_environment) | (Required) The environment where this resource will live. | `string` | n/a | yes |
| <a name="input_team"></a> [team](#input_team) | (Required) The team responsible for this resource. | `string` | n/a | yes |
| <a name="input_purpose"></a> [purpose](#input_purpose) | (Required) The purpose for this resource. | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet_ids](#input_subnet_ids) | List of subnet IDs to attach to the NLB. | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc_id](#input_vpc_id) | The ID of the VPC in which the resources should be created. | `string` | n/a | yes |
| <a name="input_nlb_name"></a> [nlb_name](#input_nlb_name) | The name of the Network Load Balancer. | `string` | `"my-nlb"` | no |
| <a name="input_internal"></a> [internal](#input_internal) | Indicates whether the NLB should be internal. | `bool` | `false` | no |
| <a name="input_enable_deletion_protection"></a> [enable_deletion_protection](#input_enable_deletion_protection) | Indicates whether deletion protection is enabled on the NLB. | `bool` | `false` | no |
| <a name="input_enable_cross_zone_load_balancing"></a> [enable_cross_zone_load_balancing](#input_enable_cross_zone_load_balancing) | Indicates whether cross-zone load balancing is enabled on the NLB. | `bool` | `false` | no |
| <a name="input_listener_port"></a> [listener_port](#input_listener_port) | The port on which the NLB listens. | `number` | `80` | no |
| <a name="input_target_group_name"></a> [target_group_name](#input_target_group_name) | The name of the target group associated with the NLB. | `string` | `"my-target-group"` | no |
| <a name="input_target_group_port"></a> [target_group_port](#input_target_group_port) | The port on which the target group receives traffic. | `number` | `80` | no |


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nlb_arn"></a> [nlb_arn](#output_nlb_arn) | The ARN of the Network Load Balancer |
| <a name="output_nlb_dns_name"></a> [nlb_dns_name](#output_nlb_dns_name) | The DNS name of the Network Load Balancer |
| <a name="output_listener_arn"></a> [listener_arn](#output_listener_arn) | The ARN of the listener |
| <a name="output_target_group_arn"></a> [target_group_arn](#output_target_group_arn) | The ARN of the target group |

<!-- END_TF_DOCS -->
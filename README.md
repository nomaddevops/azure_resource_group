## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.46.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.46.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_peering"></a> [peering](#module\_peering) | ./modules/peering | n/a |
| <a name="module_subnets"></a> [subnets](#module\_subnets) | ./modules/subnet | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_policy_definition.rg_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/policy_definition) | resource |
| [azurerm_private_dns_zone.private_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group_policy_assignment.rg_policy_assignment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group_policy_assignment) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | Full CIDR notation for the resource group, this must match the convention x.x.x.x/x | `string` | `"10.16.0.0/16"` | no |
| <a name="input_dns_zone"></a> [dns\_zone](#input\_dns\_zone) | n/a | `map(object({}))` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | Common name for the region to deploy, allowed location are France Central or France South | `string` | `"francecentral"` | no |
| <a name="input_name"></a> [name](#input\_name) | Generic name of the resource group | `string` | `null` | no |
| <a name="input_rg_policy_description"></a> [rg\_policy\_description](#input\_rg\_policy\_description) | Description of the resource group policy | `string` | `""` | no |
| <a name="input_rg_policy_mode"></a> [rg\_policy\_mode](#input\_rg\_policy\_mode) | Apply policy on resource type, All by default | `string` | `"All"` | no |
| <a name="input_rg_policy_parameters"></a> [rg\_policy\_parameters](#input\_rg\_policy\_parameters) | Custom policy parameters to override the default one | `string` | `null` | no |
| <a name="input_rg_policy_rule"></a> [rg\_policy\_rule](#input\_rg\_policy\_rule) | Custom policy to override default one | `string` | `null` | no |
| <a name="input_rg_policy_type"></a> [rg\_policy\_type](#input\_rg\_policy\_type) | Type of policy to use | `string` | `"Custom"` | no |
| <a name="input_subnet_config"></a> [subnet\_config](#input\_subnet\_config) | Map of object, where key is the subnet type to deploy(public, private, vpn) and it's multi-az configuration | <pre>map(object({<br>    is_multi_az = optional(bool)<br>  }))</pre> | <pre>{<br>  "private": {},<br>  "public": {},<br>  "vpn": {}<br>}</pre> | no |
| <a name="input_vnet_peerings"></a> [vnet\_peerings](#input\_vnet\_peerings) | Configuration of virtual network peering | <pre>map(object({<br>    rg                                = string<br>    from_allow_virtual_network_access = optional(bool)<br>    from_allow_forwarded_traffic      = optional(bool)<br>    from_allow_gateway_transit        = optional(bool)<br>    from_use_remote_gateways          = optional(bool)<br><br>    to_allow_virtual_network_access = optional(bool)<br>    to_allow_forwarded_traffic      = optional(bool)<br>    to_allow_gateway_transit        = optional(bool)<br>    to_use_remote_gateways          = optional(bool)<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group) | Outputed attributes from the resource group creation (id,location,name) |
| <a name="output_rg"></a> [rg](#output\_rg) | [DEPRECATED] Created resource group |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | Created subnets |
| <a name="output_vnet"></a> [vnet](#output\_vnet) | Created vnet |

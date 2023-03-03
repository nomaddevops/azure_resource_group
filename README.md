## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.99.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.99.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_policy_definition.rg_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/policy_definition) | resource |
| [azurerm_private_dns_zone_virtual_network_link.link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group_policy_assignment.rg_policy_assignment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group_policy_assignment) | resource |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network_peering.peering_from](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.peering_to](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |
| [azurerm_virtual_network.vnet_peerings](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | List of cidr block to use in vnet | `list(any)` | n/a | yes |
| <a name="input_dns_zone_link"></a> [dns\_zone\_link](#input\_dns\_zone\_link) | Map of private dns zone with their associated resource group name | <pre>map(object({<br>    resource_group_name = string<br>  }))</pre> | n/a | yes |
| <a name="input_have_custom_policy_rule"></a> [have\_custom\_policy\_rule](#input\_have\_custom\_policy\_rule) | Does the policy is defined by the user | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | Common name for the region to deploy, allowed location are France Central or France South | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Generic name of the resource group | `string` | `null` | no |
| <a name="input_rg_policy_description"></a> [rg\_policy\_description](#input\_rg\_policy\_description) | Description of the resource group policy | `string` | `""` | no |
| <a name="input_rg_policy_mode"></a> [rg\_policy\_mode](#input\_rg\_policy\_mode) | Apply policy on resource type, All by default | `string` | `"All"` | no |
| <a name="input_rg_policy_parameters"></a> [rg\_policy\_parameters](#input\_rg\_policy\_parameters) | Custom policy parameters to override the default one | `string` | `null` | no |
| <a name="input_rg_policy_rule"></a> [rg\_policy\_rule](#input\_rg\_policy\_rule) | Custom policy to override default one | `string` | `null` | no |
| <a name="input_rg_policy_type"></a> [rg\_policy\_type](#input\_rg\_policy\_type) | Type of policy to use | `string` | `"Custom"` | no |
| <a name="input_service"></a> [service](#input\_service) | Name of provided service | `string` | `"network"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Map to configure subnets:<br>  - enforce\_private\_link\_endpoint\_network\_policies: Set to "True" if there are private endpoints in the subnet<br>  - nsg\_security\_rule | <pre>map(object({<br>    address_prefixes                               = list(string)<br>    enforce_private_link_endpoint_network_policies = optional(bool)<br>    nsg_security_rule = optional(map(object({<br>      priority                     = number<br>      direction                    = string<br>      access                       = string<br>      protocol                     = string<br>      source_port_range            = optional(string)<br>      source_port_ranges           = optional(list(string)),<br>      destination_port_range       = optional(string),<br>      destination_port_ranges      = optional(list(string)),<br>      source_address_prefix        = optional(string)<br>      source_address_prefixes      = optional(list(string)),<br>      destination_address_prefix   = optional(string)<br>      destination_address_prefixes = optional(list(string))<br>    })))<br>  }))</pre> | `{}` | no |
| <a name="input_vnet_peerings"></a> [vnet\_peerings](#input\_vnet\_peerings) | Map of vnets to peer | <pre>map(object({<br>    rg                                = string<br>    from_allow_virtual_network_access = optional(bool)<br>    from_allow_forwarded_traffic      = optional(bool)<br>    from_allow_gateway_transit        = optional(bool)<br>    from_use_remote_gateways          = optional(bool)<br>    to_allow_virtual_network_access   = optional(bool)<br>    to_allow_forwarded_traffic        = optional(bool)<br>    to_allow_gateway_transit          = optional(bool)<br>    to_use_remote_gateways            = optional(bool)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rg"></a> [rg](#output\_rg) | Created resource group |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | Created subnets |
| <a name="output_vnet"></a> [vnet](#output\_vnet) | Created vnet |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.3.9 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | = 3.46.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.46.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_peering"></a> [peering](#module\_peering) | ./modules/peering | n/a |
| <a name="module_subnets"></a> [subnets](#module\_subnets) | ./modules/subnet | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_policy_definition.rg_policy](https://registry.terraform.io/providers/hashicorp/azurerm/3.46.0/docs/resources/policy_definition) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/3.46.0/docs/resources/resource_group) | resource |
| [azurerm_resource_group_policy_assignment.rg_policy_assignment](https://registry.terraform.io/providers/hashicorp/azurerm/3.46.0/docs/resources/resource_group_policy_assignment) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.46.0/docs/resources/virtual_network) | resource |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.46.0/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Azure Region Name (See https://azuretracks.com/2021/04/current-azure-region-names-reference/ for more infos) | `string` | `"francecentral"` | no |
| <a name="input_rg_policy_description"></a> [rg\_policy\_description](#input\_rg\_policy\_description) | Description of the resource group policy | `string` | `""` | no |
| <a name="input_rg_policy_mode"></a> [rg\_policy\_mode](#input\_rg\_policy\_mode) | Apply policy on resource type, All by default | `string` | `"All"` | no |
| <a name="input_rg_policy_parameters"></a> [rg\_policy\_parameters](#input\_rg\_policy\_parameters) | Custom policy parameters to override the default one | `string` | `null` | no |
| <a name="input_rg_policy_rule"></a> [rg\_policy\_rule](#input\_rg\_policy\_rule) | Custom policy to override default one | `string` | `null` | no |
| <a name="input_rg_policy_type"></a> [rg\_policy\_type](#input\_rg\_policy\_type) | Type of policy to use | `string` | `"Custom"` | no |
| <a name="input_subnet_config"></a> [subnet\_config](#input\_subnet\_config) | Map of object, where key is the subnet type to deploy(public, private, vpn) and it's multi-az configuration | <pre>map(object({<br>    is_multi_az = optional(bool)<br>  }))</pre> | <pre>{<br>  "private": {},<br>  "public": {},<br>  "vpn": {}<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group) | All informations regarding deployed Resource Group |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | All informations regarding deployed Subnets |
| <a name="output_virtual_network"></a> [virtual\_network](#output\_virtual\_network) | All informations regarding deployed Virtual Network |

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network_peering.peering_from](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.peering_to](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network.targeted_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_current_virtual_network"></a> [current\_virtual\_network](#input\_current\_virtual\_network) | n/a | `any` | n/a | yes |
| <a name="input_from_allow_forwarded_traffic"></a> [from\_allow\_forwarded\_traffic](#input\_from\_allow\_forwarded\_traffic) | n/a | `bool` | `true` | no |
| <a name="input_from_allow_gateway_transit"></a> [from\_allow\_gateway\_transit](#input\_from\_allow\_gateway\_transit) | n/a | `bool` | `false` | no |
| <a name="input_from_allow_virtual_network_access"></a> [from\_allow\_virtual\_network\_access](#input\_from\_allow\_virtual\_network\_access) | n/a | `bool` | `true` | no |
| <a name="input_from_use_remote_gateways"></a> [from\_use\_remote\_gateways](#input\_from\_use\_remote\_gateways) | n/a | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_targeted_resource_group_name"></a> [targeted\_resource\_group\_name](#input\_targeted\_resource\_group\_name) | n/a | `any` | n/a | yes |
| <a name="input_targeted_virtual_network_name"></a> [targeted\_virtual\_network\_name](#input\_targeted\_virtual\_network\_name) | n/a | `any` | n/a | yes |
| <a name="input_to_allow_forwarded_traffic"></a> [to\_allow\_forwarded\_traffic](#input\_to\_allow\_forwarded\_traffic) | n/a | `bool` | `true` | no |
| <a name="input_to_allow_gateway_transit"></a> [to\_allow\_gateway\_transit](#input\_to\_allow\_gateway\_transit) | n/a | `bool` | `false` | no |
| <a name="input_to_allow_virtual_network_access"></a> [to\_allow\_virtual\_network\_access](#input\_to\_allow\_virtual\_network\_access) | n/a | `bool` | `true` | no |
| <a name="input_to_use_remote_gateways"></a> [to\_use\_remote\_gateways](#input\_to\_use\_remote\_gateways) | n/a | `bool` | `false` | no |

## Outputs

No outputs.

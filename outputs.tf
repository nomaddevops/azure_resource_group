
output "rg" {
  value       = azurerm_resource_group.rg
  description = "[DEPRECATED] Created resource group"
}

output "resource_group" {
  value       = azurerm_resource_group.rg
  description = "Outputed attributes from the resource group creation (id,location,name)"
}

output "vnet" {
  value       = azurerm_virtual_network.vnet
  description = "Created vnet"
}

output "subnets" {
  value       = module.subnets
  description = "Created subnets"
}

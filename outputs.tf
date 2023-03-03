output "resource_group" {
  value       = azurerm_resource_group.rg
  description = "All informations regarding deployed Resource Group "
}

output "virtual_network" {
  value       = azurerm_virtual_network.vnet
  description = "All informations regarding deployed Virtual Network"
}

output "subnets" {
  value       = module.subnets.subnet
  description = "All informations regarding deployed Subnets"
}

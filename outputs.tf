
###############################################################
#                          AZURE_RG                           #
# Purpose: Deploy an Azure resource gorup and his components  #
#                   Last Updated: 01/11/22                    #
###############################################################

output "rg" {
  value       = azurerm_resource_group.rg
  description = "[DEPRECATED] Created resource group"
}

output "resource_group" {
  value       = azurerm_resource_group.rg
  description = "Outputed attributes from the resource group creation (id,location,name)"
}
/*
output "vnet" {
  value       = azurerm_virtual_network.vnet
  description = "Created vnet"
}

output "subnets" {
  value       = azurerm_subnet.subnet
  description = "Created subnets"
}*/

data "azurerm_virtual_network" "targeted_vnet" {
  name                = var.targeted_virtual_network_name
  resource_group_name = var.targeted_resource_group_name
}

resource "azurerm_virtual_network_peering" "peering_from" {
  name                         = format("%s-to-%s", var.targeted_virtual_network_name, var.current_virtual_network.name)
  resource_group_name          = var.targeted_resource_group_name
  virtual_network_name         = var.targeted_virtual_network_name
  remote_virtual_network_id    = var.current_virtual_network.id
  allow_virtual_network_access = var.from_allow_virtual_network_access
  allow_forwarded_traffic      = var.from_allow_forwarded_traffic
  allow_gateway_transit        = var.from_allow_gateway_transit
  use_remote_gateways          = var.from_use_remote_gateways
  lifecycle {
    ignore_changes = [name]
  }
}
resource "azurerm_virtual_network_peering" "peering_to" {
  name                         = format("%s-to-%s", var.current_virtual_network.name, var.targeted_virtual_network_name)
  resource_group_name          = var.resource_group_name
  virtual_network_name         = var.current_virtual_network.name
  remote_virtual_network_id    = data.azurerm_virtual_network.targeted_vnet.id
  allow_virtual_network_access = var.to_allow_virtual_network_access
  allow_forwarded_traffic      = var.to_allow_forwarded_traffic
  allow_gateway_transit        = var.to_allow_gateway_transit
  use_remote_gateways          = var.to_use_remote_gateways
  lifecycle {
    ignore_changes = [name, virtual_network_name]
  }
}
locals {
  today  = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  zones  = ["1", "2", "3"]
  offset = var.subnet_type == "public" ? 1 : var.subnet_type == "private" ? 10 : 100
}

resource "azurerm_subnet" "subnet" {
  name                                           = format("%s-subnet-%s", var.subnet_type, terraform.workspace)
  resource_group_name                            = var.resource_group_name
  virtual_network_name                           = var.virtual_network_name
  address_prefixes                               = toset([cidrsubnet(var.address_space, 8, local.offset)])
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies
}

resource "azurerm_route_table" "rtb" {
  name                          = format("%s-rtb-%s", var.subnet_type, terraform.workspace)
  location                      = var.resource_group_location
  resource_group_name           = var.resource_group_name
  disable_bgp_route_propagation = false

  route {
    name           = "local"
    address_prefix = var.address_space
    next_hop_type  = "VnetLocal"
  }

  tags = {
    Updated = local.today
  }
}

resource "azurerm_subnet_route_table_association" "rtb_assoc" {
  subnet_id      = azurerm_subnet.subnet.id
  route_table_id = azurerm_route_table.rtb.id
}

resource "azurerm_public_ip" "nat_gw_pip" {
  count               = var.subnet_type == "private" ? var.is_multi_az == true ? 3 : 1 : 0
  name                = format("natgw-pip-%s-az-%s", terraform.workspace, count.index + 1)
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = var.is_multi_az == true ? [count.index + 1] : [1]
}

resource "azurerm_nat_gateway" "nat_gw" {
  count                   = var.subnet_type == "private" ? var.is_multi_az == true ? 3 : 1 : 0
  name                    = format("natgw-%s-az-%s", terraform.workspace, count.index + 1)
  location                = var.resource_group_location
  resource_group_name     = var.resource_group_name
  sku_name                = "Standard"
  idle_timeout_in_minutes = 4
  zones                   = var.is_multi_az == true ? [count.index + 1] : [1]
}

resource "azurerm_nat_gateway_public_ip_association" "nat_gw_pip_assoc" {
  count                = var.subnet_type == "private" ? var.is_multi_az == true ? 3 : 1 : 0
  nat_gateway_id       = azurerm_nat_gateway.nat_gw[count.index].id
  public_ip_address_id = azurerm_public_ip.nat_gw_pip[count.index].id
}

resource "azurerm_subnet_nat_gateway_association" "nat_gateway_association" {
  count          = var.subnet_type == "private" ? var.is_multi_az == true ? 3 : 1 : 0
  subnet_id      = azurerm_subnet.subnet.id
  nat_gateway_id = azurerm_nat_gateway.nat_gw[count.index].id
}
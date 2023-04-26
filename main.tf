

data "azurerm_subscription" "current" {}

# RG
# VNET
# Nx Subnet Pub
# Nx Subnet Priv
# Nx RTB (bonus)
# Nx NatGW (bonus)

resource "azurerm_resource_group" "rg" {
  name     = format("rg-%s", terraform.workspace)
  location = var.location
  tags     = local.tags
  lifecycle {
    ignore_changes = [tags, name]
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = format("vnet-%s", terraform.workspace)
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = [var.address_space]
  tags                = local.tags
  lifecycle {
    ignore_changes = [name]
  }
}

module "subnets" {
  for_each                = var.subnet_config
  source                  = "./modules/subnet"
  address_space           = var.address_space
  resource_group_name     = azurerm_resource_group.rg.name
  resource_group_location = azurerm_resource_group.rg.location
  virtual_network_name    = azurerm_virtual_network.vnet.name
  subnet_type             = tostring(each.key)
  is_multi_az             = try(each.value.is_multi_az, false)
}

module "peering" {
  for_each                      = var.vnet_peerings
  source                        = "./modules/peering"
  current_virtual_network       = azurerm_virtual_network.vnet
  resource_group_name           = azurerm_resource_group.rg.name
  targeted_virtual_network_name = each.key
  targeted_resource_group_name  = each.value.rg
}


resource "azurerm_policy_definition" "rg_policy" {
  name         = format("policy-%s", terraform.workspace)
  policy_type  = var.rg_policy_type
  mode         = var.rg_policy_mode
  display_name = format("%s resource group policy", terraform.workspace)
  description  = var.rg_policy_description
  policy_rule  = var.rg_policy_rule != null ? var.rg_policy_rule : file("${path.module}/policies/default_rule.json")
  parameters   = var.rg_policy_parameters != null ? var.rg_policy_parameters : templatefile("${path.module}/policies/default_parameters.json", { allowed_region = var.location })
}

resource "azurerm_resource_group_policy_assignment" "rg_policy_assignment" {
  name                 = format("rg-policy-assignment-%s", terraform.workspace)
  resource_group_id    = azurerm_resource_group.rg.id
  policy_definition_id = azurerm_policy_definition.rg_policy.id
}

##################################
### Private DNS Zone VNet link ###
##################################

resource "azurerm_private_dns_zone" "private_dns_zone" {
  for_each            = var.dns_zone
  name                = each.key
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "link" {
  for_each              = var.dns_zone
  name                  = format("%s-%s", each.key, azurerm_virtual_network.vnet.name)
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = each.key
  virtual_network_id    = azurerm_virtual_network.vnet.id
  lifecycle {
    ignore_changes = [name]
  }
  depends_on = [
    azurerm_private_dns_zone.private_dns_zone
  ]
}

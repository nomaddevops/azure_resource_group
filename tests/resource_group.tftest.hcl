run "resource_group_unit_tests" {
  command = apply

  variables {
    location = "westeurope"
  }
## RG Unit Tests
  assert {
    condition = azurerm_resource_group.rg.name == "rg-${terraform.workspace}"
    error_message = "Invalid resource group name"
  }

  assert {
    condition = azurerm_resource_group.rg.location == var.location
    error_message = "Invalid location for resource group"
  }
## Vnet
  assert {
    condition = azurerm_virtual_network.vnet.resource_group_name == azurerm_resource_group.rg.name
    error_message = "Vnet is not in RG"
  }
  
  assert {
    condition = azurerm_virtual_network.vnet.name == "vnet-${terraform.workspace}"
    error_message = "Invalid vnet name"
  }

  assert {
    condition = azurerm_virtual_network.vnet.location == var.location
    error_message = "Invalid vnet region"
  }

## Policy
  assert {
    condition = azurerm_policy_definition.rg_policy.name == "policy-${terraform.workspace}"
    error_message = "Invalid policy name"
  }
  assert {
    condition = azurerm_resource_group_policy_assignment.rg_policy_assignment.name == "rg-policy-assignment-${terraform.workspace}"
    error_message = "Invalid assignment policy name"
  }
  assert {
    condition = azurerm_resource_group_policy_assignment.rg_policy_assignment.resource_group_id == azurerm_resource_group.rg.id
    error_message = "Invalid assignment policy resource group id"
  }
  assert {
    condition = azurerm_resource_group_policy_assignment.rg_policy_assignment.policy_definition_id == azurerm_policy_definition.rg_policy.id
    error_message = "Invalid assignment policy id"
  }

}
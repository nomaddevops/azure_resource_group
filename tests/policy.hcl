run "policy_unit_tests" {
  #command = apply

  variables {
    location = "westeurope"
  }
  
  assert {
    condition = azurerm_policy_definition.rg_policy.name == "policy-default"
    error_message = "Invalid policy name"
  }
  assert {
    condition = azurerm_resource_group_policy_assignment.rg_policy_assignment.name == "rg-policy-assignment-default"
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
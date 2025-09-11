# Collect all .json.tpl files under the policies directories
# Render all templates according to current environment
# Create policy definition for current env

# Collect all .json.tpl files under assignments/subscriptions/*
# Create a policy assignment for each file

locals {
  to_delete = toset([
    "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/providers/Microsoft.Authorization/policyAssignments/49768da0094b4e579dbac94a",
    "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/providers/Microsoft.Authorization/policyAssignments/16b775678d1e4257b9ce9a20",
    "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/providers/Microsoft.Authorization/policyAssignments/05fd6e0f8a2c4f54b636c3ea",
    "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/providers/Microsoft.Authorization/policyAssignments/Deny-Resource-Deletion-Assignment",
    "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/providers/Microsoft.Authorization/policySetDefinitions/13d7db1d-fd0e-4286-a665-25bf16a88855"
  ])
}

resource "azurerm_subscription_policy_assignment" "to_delete" {
  for_each = local.to_delete

  name = trimprefix(each.value, "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/providers/Microsoft.Authorization/policyAssignments/")

  subscription_id      = "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7"
  policy_definition_id = "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/providers/Microsoft.Authorization/policyDefinitions/cff68e1b-f3bb-49c1-af48-540a155c8519"
}

import {
  for_each = local.to_delete
  id       = each.value
  to       = azurerm_subscription_policy_assignment.to_delete[each.key]
}

resource "azurerm_policy_definition" "policies" {
  for_each = local.policies

  name         = each.key
  display_name = try(each.value.properties.displayName, each.key)
  description  = try(each.value.properties.description, "")
  policy_type  = try(each.value.properties.policyType, "Custom")
  mode         = each.value.properties.mode

  policy_rule = jsonencode(each.value.properties.policyRule)
  parameters  = try(jsonencode(each.value.properties.parameters), "{}")

  management_group_id = var.management_group
}
/*
resource "azurerm_subscription_policy_assignment" "subscription_assignments" {
  for_each = local.subscription_assignments

  name = each.value.name

  subscription_id      = trimprefix(each.value.properties.scope, "/subsciptions/")
  policy_definition_id = each.value.properties.policyDefinitionId

  description  = each.value.properties.description
  display_name = each.value.properties.displayName
  enforce      = each.value.properties.enforcementMode == "Default"
  metadata     = jsonencode(each.value.properties.metadata)

  dynamic "non_compliance_message" {
    for_each = try(each.value.properties.nonComplianceMessages, [])
    content {
      content = non_compliance_message.value.message
    }
  }

  not_scopes = each.value.properties.notScopes
  parameters = try(jsonencode(each.value.properties.parameters), "{}")

  # Need policy assignments to be defined before we can reference them
  depends_on = [
    azurerm_policy_definition.policies
  ]
}

resource "azurerm_management_group_policy_assignment" "management_assignments" {
  for_each = local.management_assignments

  name = each.value.name

  management_group_id  = each.value.properties.scope
  policy_definition_id = each.value.properties.policyDefinitionId

  description  = each.value.properties.description
  display_name = each.value.properties.displayName
  enforce      = each.value.properties.enforcementMode == "Default"
  metadata     = jsonencode(each.value.properties.metadata)

  dynamic "non_compliance_message" {
    for_each = try(each.value.properties.nonComplianceMessages, [])
    content {
      content = non_compliance_message.value.message
    }
  }

  not_scopes = each.value.properties.notScopes
  parameters = try(jsonencode(each.value.properties.parameters), "{}")

  # Need policy assignments to be defined before we can reference them
  depends_on = [azurerm_policy_definition.policies]
}
*/

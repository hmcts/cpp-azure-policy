# Collect all .json.tpl files under the policies directories
# Render all templates according to current environment
# Create policy definition for current env

# Collect all .json.tpl files under assignments/subscriptions/*
# Create a policy assignment for each file

resource "azurerm_policy_definition" "policies" {
  for_each = local.policies

  name         = each.key
  display_name = try(each.value.properties.displayName, each.key)
  description  = try(each.value.properties.description, "")
  policy_type  = try(each.value.properties.policyType, "Custom")
  mode         = each.value.properties.mode

  policy_rule = jsonencode(each.value.properties.policyRule)
  parameters  = try(jsonencode(each.value.properties.parameters), null)

  management_group_id = var.management_group
}

resource "azurerm_subscription_policy_assignment" "subscription_assignments" {
  for_each = local.subscription_assignments

  name = each.value.name

  subscription_id      = element(split("/", each.value.properties.scope), 2)
  policy_definition_id = each.value.properties.policyDefinitionId

  location = try(each.value.location, null)

  dynamic "identity" {
    for_each = try(each.value.identity, null) == null ? [] : [each.value.identity]
    content {
      type         = identity.value.type
      identity_ids = try(keys(identity.value.userAssignedIdentities), null)
    }
  }

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

  not_scopes = try(each.value.properties.notScopes, [])
  parameters = try(jsonencode(each.value.properties.parameters), "{}")

  # Need policy assignments to be defined before we can reference them
  depends_on = [
    azurerm_policy_definition.policies
  ]
}

resource "azurerm_resource_group_policy_assignment" "resource_group_assignments" {
  for_each = local.resource_group_assignments

  name = each.value.name

  resource_group_id    = each.value.properties.scope
  policy_definition_id = each.value.properties.policyDefinitionId

  location = try(each.value.location, null)

  dynamic "identity" {
    for_each = try(each.value.identity, null) == null ? [] : [each.value.identity]
    content {
      type         = identity.value.type
      identity_ids = try(keys(identity.value.userAssignedIdentities), null)
    }
  }

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

  not_scopes = try(each.value.properties.notScopes, [])
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

  location = try(each.value.location, null)

  dynamic "identity" {
    for_each = try(each.value.identity, null) == null ? [] : [each.value.identity]
    content {
      type         = identity.value.type
      identity_ids = try(keys(identity.value.userAssignedIdentities), null)
    }
  }

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
  parameters = try(jsonencode(each.value.properties.parameters), null)

  # Need policy assignments to be defined before we can reference them
  depends_on = [azurerm_policy_definition.policies]
}

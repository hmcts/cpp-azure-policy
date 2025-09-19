/*import {
  for_each = var.env == "live" ? [1] : []
  id = "/subscriptions/9ab65d81-930d-4cc0-a93d-367e14676bc0/providers/Microsoft.Authorization/policyDefinitions/Deny Resource Deletion"
  to = azurerm_policy_definition.policies["CppDenyResourceDeletion"]
}*/

resource "azurerm_subscription_policy_assignment" "existing" {
  name                 = "Deny-Resource-Deletion-Assignment"
  policy_definition_id = "/subscriptions/9ab65d81-930d-4cc0-a93d-367e14676bc0/providers/Microsoft.Authorization/policyDefinitions/Deny Resource Deletion"
  subscription_id      = "/subscriptions/9ab65d81-930d-4cc0-a93d-367e14676bc0"

}

import {
  for_each = var.env == "live" ? [1] : []
  id       = "/subscriptions/9ab65d81-930d-4cc0-a93d-367e14676bc0/providers/Microsoft.Authorization/policyDefinitions/Deny Resource Deletion"
  to       = azurerm_subscription_policy_assignment.existing

}

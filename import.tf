import {
  for_each = var.env == "nonlive" ? [0] : []
  id       = "/providers/Microsoft.Management/managementGroups/e2995d11-9947-4e78-9de6-d44e0603518e/providers/Microsoft.Authorization/policyDefinitions/HMCTSResourceLocationPolicy"
  to       = azurerm_policy_definition.policies["HMCTSResourceLocationPolicy"]
}

import {
  for_each = var.env == "nonlive" ? [0] : []
  id       = "/providers/Microsoft.Management/managementGroups/e2995d11-9947-4e78-9de6-d44e0603518e/providers/Microsoft.Authorization/policyDefinitions/HMCTSDiskSkuSize"
  to       = azurerm_policy_definition.policies["HMCTSDiskSkuSize"]
}

import {
  for_each = var.env == "nonlive" ? [0] : []
  id       = "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/providers/Microsoft.Authorization/policyDefinitions/Deny Resource Deletion"
  to       = azurerm_policy_definition.policies["Deny Resource Deletion"]
}

import {
  for_each = var.env == "nonlive" ? [0] : []
  id       = "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/providers/Microsoft.Authorization/policyDefinitions/46a4e5c2-fd49-4945-ad75-d32b2157c5fe"
  to       = azurerm_policy_definition.policies["Restrict Direct Role Assignment"]
}

import {
  for_each = var.env == "nonlive" ? [0] : []
  id       = "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/providers/Microsoft.Authorization/policyDefinitions/13d7db1d-fd0e-4286-a665-25bf16a887f3"
  to       = azurerm_policy_definition.policies["NSG On Interface"]
}

import {
  for_each = var.env == "nonlive" ? [0] : []
  id       = "/subscriptions/e6b5053b-4c38-4475-a835-a025aeb3d8c7/providers/Microsoft.Authorization/policyDefinitions/13d7db1d-fd0e-4286-a665-25bf16a88549"
  to       = azurerm_policy_definition.policies["NSG On Subnet"]
}

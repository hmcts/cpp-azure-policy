variable "env" {
  default = "sbox"
}

variable "product" {
  default = "azure-policy"
}

variable "location" {
  default = "uksouth"
}

variable "builtFrom" {
  default = "hmcts/cpp-azure-policy"
}

variable "tenant" {
  default = "CNP_SBOX"
}

variable "management_group" {
  type    = string
  default = "/providers/Microsoft.Management/managementGroups/e2995d11-9947-4e78-9de6-d44e0603518e"
}

variable "name_suffix" {
  type    = string
  default = ""
}

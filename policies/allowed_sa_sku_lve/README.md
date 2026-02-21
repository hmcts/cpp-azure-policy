# HMCTS Storage Account SKU Policy

The policy enables you to specify a set of SA SKUs that can be deployed in HMCTS.

## Required storage account SKUs

The specific SA SKUs that are enforced by the policy:

### SKUs

| skuName        | Performance   | Redundancy    |
| -------------- | ------------- | ------------- |
| Standard_ZRS   | Standard      | GZRS          |
| Standard_LRS   | Standard      | LRS           |
| Standard_ZRS   | Standard      | ZRS           |

## Exemptions

Send a pull request to [assignments/mgmt-groups/mg-HMCTS/assign.allowed_sa_sku_lve.json](https://github.com/hmcts/cpp-azure-policy/blob/HEAD/assignments/mgmt-groups/mg-HMCTS/assign.allowed_sa_sku_lve.json) with justification for why you need to use one not on the standard list.

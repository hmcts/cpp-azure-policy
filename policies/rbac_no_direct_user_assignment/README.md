# CPP Restrict Direct User RBAC Assignments

This policy covers two separate denial conditions:

1. **Permanent direct user RBAC assignments** — denies any `Microsoft.Authorization/roleAssignments` where `principalType` is `User`. All users are blocked; access must be granted through Entra ID Groups, Service Principals, or Managed Identities.

2. **Time-bound PIM eligible assignments for privileged administrator roles** — denies `Microsoft.Authorization/roleEligibilityScheduleRequests` where the requested role is in the configured list of privileged role definition IDs and the schedule includes a time-bound expiration (`AfterDateTime` or `AfterDuration`). This applies regardless of whether the principal is a user or group.

## Why two separate conditions?

PIM eligibility requests are a distinct ARM resource type from permanent role assignments. The portal creates eligibility requests without including `principalType` in the write payload, so the policy targets the privileged **role definition ID** and **expiration type** instead, which are reliably present at request time.

## Privileged roles covered by the PIM condition

The default `privilegedEligibleRoleDefinitionIds` parameter includes the following roles:

| Role | GUID | Type |
|---|---|---|
| Owner | `8e3af657-a8ff-443c-a75c-2fe8c4bcb635` | BuiltIn |
| Contributor | `b24988ac-6180-42a0-ab88-20f7382dd24c` | BuiltIn |
| Access Review Operator Service Role | `76cc9ee4-d5d3-4a45-a930-26add3d73475` | BuiltIn |
| Role Based Access Control Administrator | `f58310d9-a9f6-439a-9e8d-f62e7b41a168` | BuiltIn |
| User Access Administrator | `18d7d88d-d35e-4fb5-a5c3-7773c20a72d9` | BuiltIn |
| Contribute-Cannot-Delete-test | `3a5667bb-b964-48e8-19a5-a920f2bf80a0` | Custom |
| NLE Contributor | `593a72ef-741e-4228-965b-d55834a0dcb5` | Custom |
| NLE Contributor PIM | `e50d4fa1-4618-4b45-b1c0-5325c367fa81` | Custom |
| NLE Developer | `9570eb10-dac9-4b29-bf86-35e5023642c1` | Custom |
| NLE Owner | `a375a0f4-d641-40b4-9c26-e21a9b7d18de` | Custom |
| NLE Owner PIM | `0156128b-ff38-4edc-9ae4-fea3919ff917` | Custom |
| RL_NLE_CONTRIBUTOR | `17fb8404-afb3-64ba-b070-b10147108db4` | Custom |
| RL_NLE_OWNER | `0434eb54-77ee-00b4-eb3b-38763e88744c` | Custom |
| RL_PIM_NLE_CONTRIBUTOR | `97f4359a-cb2d-406e-dfb0-6b22979bff47` | Custom |
| RL_PIM_NLE_OWNER | `7934385c-44e3-a8b9-a06b-c02469d7ef65` | Custom |
| RL_PIM_NLE_SECURITY | `90cff09e-5786-a9c9-b3a6-763943ec08e4` | Custom |
| Role-Infrastructure-Admin | `4556b161-c20d-4645-9fca-fed719d2c3e0` | Custom |

To add or remove roles, override the `privilegedEligibleRoleDefinitionIds` parameter in the relevant assignment file with the updated list of role GUIDs.

## What is not blocked

- Time-bound PIM eligible assignments for **non-privileged roles** are allowed. The expiration restriction only applies to the roles listed in the privileged role table above.
- PIM eligible assignments with no expiry (`NoExpiration`) for privileged roles are allowed.

## Allowed assignment routes

For permanent access, use one of the following principal types:

- Microsoft Entra ID Groups
- Service Principals
- Managed Identities

## Effect

The `effect` parameter supports `Audit`, `Deny`, and `Disabled`. Assignments currently set this to `Deny`.

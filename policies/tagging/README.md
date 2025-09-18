# HMCTS Tagging Policy

## Required tags
Required tags, common and specific to subscription of resource.

All environments and resources:
 - environment
 - application
 - businessArea
 - builtFrom

Sandbox only:
 - expiresAfter

## Allowed values
Tags and their allowed values.

application:

Name of the application or service

environment:
- mdv
- sit
- dev
- nft
- mpd
- prp
- prx
- prd
- nft02

businessArea:
 - CFT
 - crime
 - Cross-Cutting

builtFrom:
 - Name or URL of repository


## Check compliance

You can view the current compliance status in the Azure portal.

- [CPP Nonlive](https://portal.azure.com/#view/Microsoft_Azure_Policy/PolicyComplianceDetail.ReactView/assignmentId/%2Fproviders%2Fmicrosoft.management%2Fmanagementgroups%2Fe2995d11-9947-4e78-9de6-d44e0603518e%2Fproviders%2Fmicrosoft.authorization%2Fpolicyassignments%2Flocation_global/scopes~/%5B%22%2Fsubscriptions%2F0511a7fe-771b-4ffa-9348-c59e9c4a87bd%22%2C%22%2Fsubscriptions%2F8cdb5405-7535-4349-92e9-f52bddc7833a%22%2C%22%2Fsubscriptions%2Fe6b5053b-4c38-4475-a835-a025aeb3d8c7%22%5D/policyDefinitionId/%2Fproviders%2Fmicrosoft.management%2Fmanagementgroups%2Fe2995d11-9947-4e78-9de6-d44e0603518e%2Fproviders%2Fmicrosoft.authorization%2Fpolicydefinitions%2Fcppresourcelocationpolicy)
- [IdAM Nonlive](https://portal.azure.com/#view/Microsoft_Azure_Policy/PolicyComplianceDetail.ReactView/assignmentId/%2Fsubscriptions%2F0511a7fe-771b-4ffa-9348-c59e9c4a87bd%2Fproviders%2Fmicrosoft.authorization%2Fpolicyassignments%2Fcpptagging-idam/scopes~/%5B%22%2Fsubscriptions%2F0511a7fe-771b-4ffa-9348-c59e9c4a87bd%22%2C%22%2Fsubscriptions%2F8cdb5405-7535-4349-92e9-f52bddc7833a%22%2C%22%2Fsubscriptions%2Fe6b5053b-4c38-4475-a835-a025aeb3d8c7%22%5D/policyDefinitionId/%2Fproviders%2Fmicrosoft.management%2Fmanagementgroups%2Fe2995d11-9947-4e78-9de6-d44e0603518e%2Fproviders%2Fmicrosoft.authorization%2Fpolicydefinitions%2Fcpptagging)
- Live (TODO)

Type your teams name to find any resources.

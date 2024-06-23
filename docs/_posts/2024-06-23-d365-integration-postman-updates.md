---
layout: post
title:  "Dynamics 365 Finance and Operations: Trigger Refresh Data Entities From Postman"
date:   2024-06-23 12:30:00 +0000
categories: d365 finance integrations
tags: OData Axapta Integration Dynaimcs AAD DynamicsAx D365FO FinOpsDevOps App registration MSDyn365FO AXCommunityBlog EntraID D365 Dynamics365 MSDAX X++ DAX MSDyn365 Entra Dyn365 Dyn365FO SysAdmin D365 AAD Azure Active Directory DMF Postman
---

A recent community forum question regarding triggering a DMF data entity refresh from Power Automate led me to doing some research and finding that there is an out-of-the box OData action to trigger the update or Entities in DMF. I've added the call to the D365 Finance APIs Postman workspace under the OData collection in a new folder "Actions":

![New Actions Folder in Postman](/assets/images/2024-06-23/1.png)

The Postman Workspace is publicly accessible to copy, fork, download and use here: [Postman: Dynamics 365 Finance APIs](https://www.postman.com/anthonyblakedev/workspace/dynamics-365-finance-apis)

Run the authentication step to obtain a bearer token from Entra ID, then run the Refresh Entities request. On success the request returns an HTTP 204 and empty body.

Inside D365, in the Data Management workspace, the notification which is triggered when refreshing data entities manually through the D365 UI is displayed:

![Entity refresh message in D365](/assets/images/2024-06-23/2.png)

I found this action by looking at the fantastic d365fo.integrations Powershell module on GitHub, created by Motz Jensen, author of the must have Powershell module for D365 Environment Management, d365fo.tools.

Take a look at the Powershell command for triggering OData Data Entity refresh here, and think about how useful it would be to use it to trigger a refresh from a CI/CD pipeline:

[d365fo.integrations on GitHub](https://github.com/d365collaborative/d365fo.integrations/blob/development/d365fo.integrations/functions/invoke-d365dmfinit.ps1)



## Additions

The following updates and additions have been made to the Dynamics 365 Finance APIs Postman Workspace:

# OData Actions
- Initialise DMF Entity Refresh POST

## Updates

None

_The Dynamics 365 Finance APIs workspace is a public postman workspace created to bring together examples of the various methods of connecting to Dynamics 365 for Finance and Operations (SCM/HR), into one convenient and reusable place. Contact me via LinkedIn, Twitter, or Email using the details in the footer if you would like to contribute to the project. The workspace is available here: [Postman: Dynamics 365 Finance APIs](https://www.postman.com/anthonyblakedev/workspace/dynamics-365-finance-apis)_


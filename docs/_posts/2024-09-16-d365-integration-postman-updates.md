---
layout: post
title:  "Dynamics 365 F&O: Import & Export Package APIs Added"
date:   2024-09-16 18:15:00 +0000
categories: d365 finance integrations
tags: OData Axapta Integration Dynaimcs AAD DynamicsAx D365FO FinOpsDevOps App registration MSDyn365FO AXCommunityBlog EntraID D365 Dynamics365 MSDAX X++ DAX MSDyn365 Entra Dyn365 Dyn365FO SysAdmin D365 AAD Azure Active Directory DMF Postman
---

There have been 2 significant additions to the Dynamics 365 Finance APIs Workspace this week, and 1 modification. The additions are the first import and export examples in the Package Rest API collection, which give a working example of how to call the APIs from Postman, and therefore from any integrating application. (Dont forget to try out Postman's code generation functionality). 

There are 2 reasons for these additions being very significant to the project. The obvious reason is that this is the first working demo of the Package APIs to be added to the project, which extends it's potential to a new import type and hopefully a wider user base. The second, more important reason is that the Package API import and export examples have been added to the project by another member of the community, making this a true community collaboration project. The previous examples for Authentication, OData, Recurring integrations, and Services had been added to the Workspace by me.

**THANK YOU for your excellent contribution [Reza Alirezaei](https://www.linkedin.com/in/rezaal/), especially when assisting me in testing the Postman merge process and navigating Postmans "unexpected behaviours" when collaborating together.** 

Take a look at the new Package API examples and try them out, they are now part of the Dynamics 365 Finance APIs Postman workspace, which is a free to use **community project** (woohoo!), publicly accessible to copy, fork, download and experiment with here: [Postman: Dynamics 365 Finance APIs](https://www.postman.com/anthonyblakedev/workspace/dynamics-365-finance-apis){:target="_blank"}

Another contribution made by [Reza Alirezaei](https://www.linkedin.com/in/rezaal/) was an improvement to the test script for the authentication step, which stores the bearer token in Postman for subsequent authentication of calls to the Dynamics 365 APIs without any manual intervention. This involved replacing some deprecated code. 

## Vendor Groups Import via Package API

![Vendor Groups Import via Package API in Postman](/assets/images/2024-09-16/1.PNG)

Postman: [Dynamics 365 Finance APIs: Import Vendor Groups](https://www.postman.com/anthonyblakedev/workspace/dynamics-365-finance-apis/request/22139284-f7b5f6ea-8423-4fb3-8dcb-547c4688cec2?action=share&source=copy-link&creator=22139284&active-environment=a6fe8359-b53f-49db-bd87-616db2899d1a){:target="_blank"}

Type: `POST`, `PUT`

Name: `GetWriteableURL`, `UploadBlob`, `ImportFromPackage`, `GetExecutionStatus` 

Request: `{{resource}}data/DataManagementDefinitionGroups/Microsoft.Dynamics.DataEntities.ImportFromPackage`

Body: 
```
{
    "packageUrl": "{{getwriteableurl}}",
    "definitionGroupId": "VendorGroupsFileImport",
    "executionId": "",
    "execute": true,
    "overwrite": true,
    "legalEntityId": "USMF"
}
```
This collection of requests will import a DMF Data package via the Package API. Pay attention to all the steps in the import folder, they will need to run in order to obtain a blob upload URL, upload the package, trigger the import of the package in DMF, then poll for the package import results. The DMF project definition is `VendorGroupsFileImport` as specified in the `ImportFromPackage` step. To use, you will need to add a DMF package containing Vendor Groups to the body of the `UploadBlob` step. The format of this package can be obtained by firstly running the Export of Vendor Groups, details below.

## Vendor Groups Export via Package API

![Vendor Groups Export via Package API in Postman](/assets/images/2024-09-16/2.PNG)

Postman: [Dynamics 365 Finance APIs: Export Vendor Groups](https://www.postman.com/anthonyblakedev/workspace/dynamics-365-finance-apis/request/22139284-42187332-09cd-40f8-9f18-30b36eda0f48?action=share&source=copy-link&creator=22139284&active-environment=a6fe8359-b53f-49db-bd87-616db2899d1a){:target="_blank"}

Type: `POST`, `GET`

Name: `ExportToPackage`, `GetExecutionStatus`, `GetExportedPackageURL`, `GetBlob`

Request: `{{resource}}data/DataManagementDefinitionGroups/Microsoft.Dynamics.DataEntities.ExportToPackage`

Body:
```
{
    "definitionGroupId": "VendorGroupsFileExport",
    "packageName": "VendorGroupsFileExport.csv",
    "executionId": "",
    "reExecute": true,
    "legalEntityId": "usmf"
}
```

This collection of requests will export a DMF package of Vendor Groups using a specific DMF Export project `VendorGroupsFileExport` which needs to be configured in the source environment, in the DMF workspace. The steps are similar to the Import of Vendor groups, in a reversed order. Initially run `ExportToPackage` to trigger the export from D365 DMF, `GetExecutionStatus` to poll the export until completion, `GetExportedPackageURL` to get the location of the package in blob storage when the export is completed, and `GetBlob` to download the package.

## Change Summary

The following updates and additions have been made to the Dynamics 365 Finance APIs Postman Workspace:

## Additions

# Package Rest API/Vendor Groups/Import
- GetWriteableURL
- UploadBlob
- UploadFromPackage
- GetExecutionStatus

# Package Rest API/Vendor Groups/Export
- ExportToPackage
- GetExecutionStatus
- GetExportedPackageURL
- GetBlob

## Updates

# Authenticate
- Get Bearer Token

_The Dynamics 365 Finance APIs workspace is a public postman workspace created to bring together examples of the various methods of connecting to Dynamics 365 for Finance and Operations (SCM/HR), into one convenient and reusable place. Contact me via LinkedIn, Twitter, or Email using the details in the footer if you would like to contribute to the project. The workspace is available here: [Postman: Dynamics 365 Finance APIs](https://www.postman.com/anthonyblakedev/workspace/dynamics-365-finance-apis)_


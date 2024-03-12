---
layout: post
title:  "Dynamics 365 Finance and Operations: Non-Azure AD external user deprecation report"
date:   2024-03-11 08:00:00 +0000
categories: d365 finance sysadmin
tags: Axapta Integration Dynaimcs AAD DynamicsAx D365FO FinOpsDevOps App registration MSDyn365FO AXCommunityBlog EntraID D365 Dynamics365 MSDAX X++ DAX MSDyn365 Entra Dyn365 Dyn365FO SysAdmin D365 AAD Azure Active Directory
---

Previously, I looked at the upcoming restriction on users who are not present in the same tenant D365 Finance and Operations Entra ID (AAD), and specifically how the restriction may affect integrations: 

[Dynamics 365 Finance and Operations: Non-Azure AD external user sign-in Deprecation March 2024](https://anthonyblake.github.io/d365/finance/sysadmin/2023/12/18/d365-external-user-deprecation.html)

As rollout begins for this new access restriction, Microsoft have added a new report to D365 Finance to assist administrators who are looking to identify which of their D365 users require action. The report is available from version 10.0.39, Platform Update 63 (in public preview at time of writing).

The report is named Invalid users and is available in System Administration: [Invalid users in Dynamics 365 Finance](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/fin-ops/sysadmin/invalid-users)

The report highlights users who are not present in Entra ID on the host tenant, and users whose telemetry ID does not match their Entra ID Object ID, both useful to highlight users which are affected by the cross tenant deprecation.

The new menu item can be found in **System administration -> Invalid users**. The report is initially empty, it can be populated using the *Refresh* button:

![Invalid Users: Refresh](/assets/images/2024-03-11/invalid-users-refresh.PNG)

The Refresh functionality has user or batch options, so it can be run in the background for systems with large user numbers. On a B8sm Cloud Hosted Environment, populated with Contoso Demo data, it took a couple of minutes when running in the user session:

![Invalid Users: Batch Options](/assets/images/2024-03-11/invalid-users-batch-options.PNG)

![Invalid Users: Processing](/assets/images/2024-03-11/invalid-users-processing.PNG)

The Contoso Demo DB contains approximately 90 users (give or take a couple of my own). For implementations with 250+ users, I would run this in batch.

The other benefit of the Contoso Demo DB is that there are lots of dummy users, which don't exist on my Entra ID tenant. The first test run of the report produced a great demo and a lot of results:

![Invalid Users: Results](/assets/images/2024-03-11/invalid-users-reports.PNG)

The report returned the *Invalidity reason* "**User not found in the Microsoft Entra ID**" for all the Contoso users, as they do not exist on the same tenant as my environment. In a real implementation, this would be the basis for a review & cleanse, followed by potentially adding the missing users as guests on the Entra Id tenant.

![Invalid Users: Export](/assets/images/2024-03-11/invalid-users-export-to-excel.PNG)

The report includes an export to Excel option which can be used to export, cleanse, and send off to your Entra ID administrator for action.

For more information on the upcoming changes to EntraId/AAD authentication, see the links below:

The announcement of the deprecation is here: [Feature deprecation effective March 2024: Non-Azure AD external user sign-in](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/fin-ops/get-started/removed-deprecated-features-platform-updates#non-azure-ad-external-user-sign-in)

Microsoft have provided a link with clear instructions on how to implement guest accounts in Entra here: [Microsoft Learn: What is b2b? B2B collaboration overview](https://learn.microsoft.com/en-us/entra/external-id/what-is-b2b)
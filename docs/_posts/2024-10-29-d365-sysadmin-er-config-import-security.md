---
layout: post
title:  "Dynamics 365 Finance: Import Electronic Reporting Configuration from Dataverse"
date:   2024-10-29 16:30:00 +0000
categories: d365 finance sysadmin
tags: OData Axapta Integration Dynaimcs AAD DynamicsAx D365FO FinOpsDevOps App registration MSDyn365FO AXCommunityBlog EntraID D365 Dynamics365 MSDAX X++ DAX MSDyn365 Finance Dyn365 Dyn365FO SysAdmin D365 D365FSCM F&SCM System Admin SysAdmin ER Electronic Reporting Config Dataverse
image: /assets/images/featured/featured-paperwork-1.jpg
author: "Anthony Blake"
---

## Overview

This post expands on a Microsoft Learn article, which gives instructions for configuring Dataverse to allow import of Electronic Reporting configurations to Dynamics 365 Finance: [Import Electronic reporting (ER) configurations from Dataverse](https://learn.microsoft.com/en-us/dynamics365/finance/localizations/global/workspace/gsw-import-er-config-dataverse){:target="_blank"}

# Prerequisites
There is one prerequisite for the ER configuration import, you must configure the ER import in the **integrated** Dataverse environment, so you must have it deployed. Setup instructions are here: [Connect finance and operations apps with a new Microsoft Dataverse instance](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/power-platform/environment-lifecycle-connect-finops-new-dv){:target="_blank"}

## Import Steps

There are 3 main steps to import ER configuration:
- Configure Dataverse Security in the integrated Dataverse environment
- Import Globalisation Studio in the integrated Dataverse environment: [Install from App Source here](https://appsource.microsoft.com/en-us/product/dynamics-365/mscrm.d365-globalizationartifacts-preview?flightCodes=a0bc3ba0711a4558bf3a2932a66dc11d){:target="_blank"}
- Import the ER Configuration in the Dynamics 365 Finance environment: [Import configurations from Dataverse](https://learn.microsoft.com/en-us/dynamics365/finance/localizations/global/workspace/gsw-import-er-config-dataverse#open-the-dataverse-configuration-repository){:target="_blank"}

As the import steps are straightforward, this post will focus on the steps required to configure security in Dataverse to enable the D365 Finance app user to use the import functionality.

## Dataverse Security Configuration Steps

Open the [Power Portal Admin Centre](https://admin.powerplatform.microsoft.com/){:target="_blank"}.

Browse to **environments**.

![Power Platform Admin Center Environments](/assets/images/2024-10-29/1.png)

Select the environment integrated with the D365 Finance environment where you need the Electronic Reporting configurations, and open **settings**.

![PPAC Environment Settings](/assets/images/2024-10-29/2.png)

Under **Users + permissions**, open **Security roles**.

![PPAC Environment Security Roles](/assets/images/2024-10-29/3.png)

Click the **New role** button.

![PPAC New Role](/assets/images/2024-10-29/4.png)

Name the new security role something appropriate, for example **Electronic Reporting Config Import**.

Select the business unit for the user. This is probably the default business unit for the environment, rather than one of the D365 Finance linked legal entities.

Leave the other settings as default.

![PPAC ER Config Role](/assets/images/2024-10-29/5.png)

Next, you need to add permissions to the role for the following tables:

- Electronic Reporting Configuration File
- Electronic Reporting Configurations Index File
- Globalization Feature File
- Globalization Features Index File

With the new role open, for each table, go to the **search** box and search for the table name.

![PPAC Search Box](/assets/images/2024-10-29/6.png)

For each of the four tables above, you need to add the following permissions for **Organization**

- Create
- Read
- Write
- Delete
- Append
- Append to
- Assign
- Share

There is a quicker way than setting each permission individually.

Click on the menu beside the table name, and select **Permission Settings**.

![PPAC Permission Settings](/assets/images/2024-10-29/7.png)

In **permission settings**, select **Full Access** to assign the full set of required permissions, at organization level.

![PPAC Table Full Access](/assets/images/2024-10-29/8.png)

After repeating for all 4 tables, return the the **environment settings** page and click users.

![PPAC Users](/assets/images/2024-10-29/9.png)

Find the user who needs to import Electronic Reporting configuration into D365 Finance, and go to **Manage security roles**.

![PPAC Manage Security Roles](/assets/images/2024-10-29/10.png)

Assign the new **security role** you created earlier, if you used the name from the example it will be called **Electronic Reporting Config Import**. 

## Summary

You have now created, configured, and assigned a security role to a D365 Finance user in the integrated Dataverse environment, if you already installed Globalisation studio via App Source, the user can now go ahead and import ER configuration to D365 Finance. 

---
layout: post
title:  "D365 F&O: Apply a Service Update to a Unified Environment"
date:   2026-02-16 19:30:00 +0000
categories: d365 finance sysadmin
tags: Integration Dynaimcs AAD DynamicsAx D365FO FinOpsDevOps MSDyn365FO AXCommunityBlog D365 Dynamics365 MSDAX X++ DAX MSDyn365 Finance Dyn365 Dyn365FO SysAdmin D365 D365FSCM F&SCM System Admin SysAdmin Azure PPAC xpp xppgroupies unified developer unidev UDE
image: /assets/images/featured/featured-desk-1.jpg 
author: "Anthony Blake"
---

## Overview

This article documents the steps to take to update the version of a D365 F&O environment which was deployed via the Power Platform Admin Center.

## Prerequisites

- A D365 F&O unified environment provisioned via the Power Platform Admin Center.
 
## Steps

Browse to [https://admin.powerplatform.microsoft.com/](https://admin.powerplatform.microsoft.com/)
 
From the menu select **Manage -> Environments**, find the environment to update and click it to be taken to the environment details page.
 
From here, click **Dynamics 365 apps** from the **Resources** section.
 
![Step 1](/assets/images/2026-02-16/1.png)
  
From the Dynamics 365 apps list, find the app named **Dynamics 365 Finance and Operations Provisioning App**. Click the ellipses menu, and select **Manage**.
 
![Step 2](/assets/images/2026-02-16/2.png)
 
Clicking **Manage** should give the following warning, click **OK** to continue to the Provisioning App.
 
![Step 3](/assets/images/2026-02-16/3.png)
 
Click the dropdown under **Select version of the product**, and the available versions of Finance and Operations will be displayed. The environment I updated is configured for Early Release, which is why there is a preview version available for deployment:
 
![Step 4](/assets/images/2026-02-16/4.png)
 
Check the box to agree to the terms of service, and click the **Install** button.
 
Back in the **Dynamics 365 Apps** screen, the **Dynamics 365 Finance and Operations Provisioning App** will  display a status of **Installing…**
 
![Step 5](/assets/images/2026-02-16/5.png)
 
To verify the correct version is installing, click on the ellipses menu again, and click the **Details** option.
 
![Step 6](/assets/images/2026-02-16/6.png)
 
The window which opens to the right of the admin center screen will also show a status of **Installing…**, and show which Finance and Operations version is currently being installed.
 
![Step 7](/assets/images/2026-02-16/7.png)
 
Similar to LCS, usually within a couple of hours, you should see that the update is complete.
 
![Step 8](/assets/images/2026-02-16/8.png)
 
Which is also reflected in the details screen, with updated **Version number**, which here was 10.0.47.

![Step 9](/assets/images/2026-02-16/9.png)

**Enjoy trying out the latest features on your newly updated PPAC-managed D365 ERP environment!**
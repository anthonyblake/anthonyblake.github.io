---
layout: post
title:  "Dynamics 365 F&O Apps: Install the Expense Management Power App"
date:   2025-03-08 07:30:00 +0000
categories: d365 finance sysadmin
tags: Integration Dynaimcs AAD DynamicsAx D365FO FinOpsDevOps App registration MSDyn365FO AXCommunityBlog EntraID D365 Dynamics365 MSDAX X++ DAX MSDyn365 Finance Dyn365 Dyn365FO SysAdmin D365 D365FSCM F&SCM System Admin SysAdmin Vendor Supplier Expense Management Power App Dataverse
image: /assets/images/featured/featured-calculator-1.jpg 
author: "Anthony Blake"
---

## Overview

This article is a step-by-step guide to installing the D365 Expense Management App, which requires a combination of D365 F&SCM and Power Platform Admin Centre add-ins, features, and app installs.

## Prerequisites

The D365 Expense Management App is a canvas Power App (plus other components) which utilises D365 Virtual Entities.

You must install the app in the integrated Dataverse environment, so you must have it deployed. Setup instructions are here: [Connect finance and operations apps with a new Microsoft Dataverse instance - Finance & Operations](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/power-platform/environment-lifecycle-connect-finops-new-dv) 

The Virtual Entity solution must also be deployed to the environment from App Source, if it is not already. Setup instructions are here: [Configure Dataverse virtual entities - Finance & Operations](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/power-platform/admin-reference#get-virtual-entity-solution)

## Instructions

# Install Expense Management LCS Add-in

From the Environment Page in LCS, under Power Platform Integration, click install new add in:

![LCS Add-in](/assets/images/2025-03-08/1.png)

Select Expense Management:

![EM Add-in](/assets/images/2025-03-08/2.png)

On the next page Click install.

Wait for the add-in to install, it should only take a few minutes.

# Enable Expense Management Features in D365 F&SCM

In D365 F&SCM, in the feature management workspace, enable the following 2 features:

![Feature management](/assets/images/2025-03-08/3.png)

Expense report's re-imagined is a prerequisite for the expense management app.

Auto-match and create expense from receipt enables OCR functionality when capturing receipts.

# Enable code components

Code components are required to display localised labels, and must be enabled before installing the expense management mobile app. For more information see here: [Code components for canvas apps - Power Apps](https://learn.microsoft.com/en-us/power-apps/developer/component-framework/component-framework-for-canvas-apps) 

In Power Platform Admin Centre, browse to Environment Settings:

![Environment settings](/assets/images/2025-03-08/5.png)

Under Product, browse to Features:

![Environment Product Features](/assets/images/2025-03-08/6.png)

Find and toggle to On, the feature Enabled Power Apps component framework for canvas apps:

![Enable code components](/assets/images/2025-03-08/8.png)

>Before leaving the page remember: Scroll to the bottom of the form and click the Save button!
 
# Install Dynamics 365 expense management from App Source

Browse to the following URL on app source, and click the Get it now button: [Dynamics 365 expense management](https://appsource.microsoft.com/en-us/product/dynamics-365/mscrm.msdyn_expense_mobile-preview?flightCodes=d365expensemobile&exp=ubp8) 

![App source](/assets/images/2025-03-08/9.png)

You will be redirected to the Power Platform Admin Centre, where you need to select the environment to install to:

![Environment select](/assets/images/2025-03-08/10.png)

Wait for the app to install. This step can take quite a long time, so its a good time to go and make tea.

![Installing](/assets/images/2025-03-08/11.png)

![MEME](/assets/images/2025-03-08/15.png)

After drinking your tea, the install should be complete:

![Installed](/assets/images/2025-03-08/13.png)

The app is installed on the environment and ready to use.

## Next Steps

- Assign the Expense Mobile User role to your D365 Expense Management App users via the environment settings in Power Platform Admin Centre, see here: [Install and configure the Dynamics 365 expense management mobile app](https://learn.microsoft.com/en-us/dynamics365/project-operations/expense/new-expense-mobile-app-install-and-configure#install-the-dynamics-365-expense-management-mobile-app-in-dataverse) 

- Assign security roles to your D365 Expense Management App users in D365 F&SCM, see here: [Install and configure the Dynamics 365 expense management mobile app](https://learn.microsoft.com/en-us/dynamics365/project-operations/expense/new-expense-mobile-app-install-and-configure#enable-users-in-dynamics-365-finance)

- Configure your users and employees inside D365, see here: [Install and configure the Dynamics 365 expense management mobile app](https://learn.microsoft.com/en-us/dynamics365/project-operations/expense/new-expense-mobile-app-install-and-configure#enable-users-in-dynamics-365-finance)

- Share the app with your users, see here: [Share a canvas app with your organization - Power Apps](https://learn.microsoft.com/en-us/power-apps/maker/canvas-apps/share-app)

- Install the app on your mobile device, see here: [Install and open the Dynamics 365 expense management mobile app on a mobile device](https://learn.microsoft.com/en-us/dynamics365/project-operations/expense/mobile-app-install-on-mobile-device) 

 

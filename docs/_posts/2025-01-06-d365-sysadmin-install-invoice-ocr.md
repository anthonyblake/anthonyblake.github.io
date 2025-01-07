---
layout: post
title:  "Dynamics 365 F&O Apps: Install the Invoice Capture Power App"
date:   2025-01-06 07:30:00 +0000
categories: d365 finance sysadmin
tags: OData Axapta Integration Dynaimcs AAD DynamicsAx D365FO FinOpsDevOps App registration MSDyn365FO AXCommunityBlog EntraID D365 Dynamics365 MSDAX X++ DAX MSDyn365 Finance Dyn365 Dyn365FO SysAdmin D365 D365FSCM F&SCM System Admin SysAdmin Vendor Supplier Invoice OCR Dataverse
image: /assets/images/featured/featured-chequebook-1.jpg 
author: "Anthony Blake"
---

## Overview

I have recently deployed the Invoice Capture OCR app to a number of different environments and for a number of different projects, and in the process have documented the simplified steps required with screenshots, which I use ahead of the official documentation. 

This guide is a quick step-by-step to deploy Invoice Capture OCR based on my notes, and is a supplement to the main installation documentation which can be found here: [Install Invoice Capture](https://learn.microsoft.com/en-us/dynamics365/finance/accounts-payable/install-invoice-capture)

## Prerequisites

- D365 Finance instance, with the Invoice Capture feature enabled
- Integrated Power Platform environment deployed
- Finance and Operations Virtual Entity Installed on the environment

**Ensure Invoice Capture Feature is Enabled**

The feature _Invoice capture for Dynamics 365 Finance_ is on by default, so it is unlikely you will need to enable it. To check, in D365 Finance, head to the Feature Management workspace, at _Workspaces->Feature management_

Under the tab _All_, search for _Invoice capture_

![Feature management workspace](/assets/images/2025-01-06/2.png)

**Ensure Finance and Operation Virtual Entity is Installed**

From the Power Platform admin centre, under Environments, open detailed view.

![Environment detailed view](/assets/images/2025-01-06/3.png)

From the Environment details page, open _Dynamics 365 Apps_.

![Dynamics 365 Apps](/assets/images/2025-01-06/1.png)

Under the list of installed apps, search for _Finance and Operations Virtual Entity_.

![Finance and Operarions Virtual Entity](/assets/images/2025-01-06/4.png)

The app enables virtual entities which are used by the Invoice Capture app to access real time data in D365 Finance.

If the app is not installed, it can be installed from App Source here:

[Finance and Operations Virtual Entity](https://appsource.microsoft.com/en-us/product/dynamics-365/mscrm.finance_and_operations_virtual_entity)


## Invoice Capture Installation

Invoice Capture can be installed from App Source here: [Invoice Capture for Dynamics 365 Finance](https://appsource.microsoft.com/en-us/product/dynamics-365/mscrm.dynamics365-fno-invoice-capture-preview?flightCodes=15e3cf87e5e04ac5872c702deb9f7ae7)

![Invoice Capture on App Source](/assets/images/2025-01-06/5.png)

Click on _Free Trial_ to install, it is actually the full version.

![Invoice Capture Redirect](/assets/images/2025-01-06/6.png)

Clicking Free Trial redirects you back to the Power Platform Admin Center, where you can select the environment to install the Invoice Capture app components. Select the environment you are installing to in click _Install_.

![Invoice Capture Install Environments](/assets/images/2025-01-06/7.png)

The Invoice Capture app will be installing on the selected enviornment for a few minutes.

![Invoice Capture Installing](/assets/images/2025-01-06/8.png)

Once complete, the Invoice Capture app will appear as installed.

![Invoice Capture Installed](/assets/images/2025-01-06/9.png)

Everything required is now installed. There are other configurations required, for example to enable legal entities, in the Invoice Capture app and in D365 Finance. 

There are also 2 new roles created in Power Platform Admin Center as part of the installation.

![Invoice Capture Roles](/assets/images/2025-01-06/11.png)

Apply the Accounts Payable Admin Role to any consultant who needs to configure and administer the Invoice Capture app, apply the Accounts Payable Clerk Role to your end users. 

## Summary

This guide covers all the required steps to install the Invoice Capture for Dynamics 365 Finance app, and once complete the app is ready to configure and start utilising OCR to automatically import Accounts Payable invoices.

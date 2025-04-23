---
layout: post
title:  "Dynamics 365 F&O Apps: Expense Management Add-in Installation Failed"
date:   2025-04-23 07:30:00 +0000
categories: d365 finance sysadmin
tags: Integration Dynaimcs AAD DynamicsAx D365FO FinOpsDevOps MSDyn365FO AXCommunityBlog D365 Dynamics365 MSDAX X++ DAX MSDyn365 Finance Dyn365 Dyn365FO SysAdmin D365 D365FSCM F&SCM System Admin SysAdmin Vendor Supplier Expense Management Add-In LCS Power App Dataverse
image: /assets/images/featured/featured-calculator-1.jpg 
author: "Anthony Blake"
---

## Overview

When installing the Expense Management Add-In on your Dynamics 365 F&O Environment in LCS, you may encounter a failure, with the only information available being the Installation Failed error message. This is more common on newly provisioned environments, but can happen on any environment. 

You click install new add-in:

![LCS install add-in](/assets/images/2025-04-23/1.png)

You select Expense Management:

![Expense management details](/assets/images/2025-04-23/2.png)

However the installation fails. It will look exactly like this:

![Expense Management installation failed](/assets/images/2025-04-23/3.png)

## Solution

The cause of the problem is usually 2 undocumented data prerequisites in D365 the environment which you are installing to.

- The System Language must be set
- A record must exist in Expense Parameters

## Set the System Language

In D365, browse to or search for System Parameters. Ensure the system language is set, and save the record. Even if the system language is already set, be sure to click Save:

![System parameteres form](/assets/images/2025-04-23/4.png)

## Save an Expense Parameters record

In D365, browse to or search for Expense Management Parameters. All that's required is to hit save then close the form, no fields need to be changed:

![Expense management parameteres form](/assets/images/2025-04-23/5.png)

## Retry!

Click abort and then retry the installation, via install new Add-in. 

## One more thing...

After following the steps, and retrying the installation, the install occasionally fails again on the first retry. Retry a second time, and all should now work, and after a few minutes, the Expense Management Add-in will be installed.


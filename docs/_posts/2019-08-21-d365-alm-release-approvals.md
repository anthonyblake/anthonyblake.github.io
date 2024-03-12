---
layout: post
title:  "Azure DevOps Release Pipeline for Dyn365FO - Part 2: Scheduled Releases with Approvals"
date:   2019-08-21 07:31:00 +0000
categories: d365 finance alm
tags: Axapta Integration Dynaimcs AAD DynamicsAx D365FO FinOpsDevOps App registration MSDyn365FO AXCommunityBlog EntraID D365 Dynamics365 MSDAX X++ DAX MSDyn365 Entra Dyn365 Dyn365FO ALM Azure DvOps
---

This post follows on from Part 1, which covered;

- Installed to Dynamics 365 Unified Operations Tools in Azure DevOps
- Created an Azure App Registration
- Created the Service Connection to Link Azure DevOps to LCS
- Started a new Release Pipeline
- Added a Task to Upload an Asset to LCS
- Added a Task to Deploy an Asset to an LCS Environment

This simple release pipeline is used as a start point for this article.

[Azure DevOps Release Pipeline for Dyn365FO - Part 1: Automated Package Upload & Deploy via LCS API]()

# Scenario 1 - Scheduled Upload and Deploy

The first step is to add a schedule the automated deployment. At the end of Part 1, the Release Pipeline we created depended on a manual trigger from an Azure DevOps user. 
   
The next step is to add a schedule to trigger the Release Pipeline automatically. Open the Release Pipeline by clicking Edit, and click on the clock icon in the Artifcacts section, beside the text Schedule not set.

![Example 1](/assets/images/2019-08-21/1.PNG)

In the Schedule release trigger dialog, click the toggle to enable. This reveals the options for scheduling. For this example I have setup a daily release trigger at 5pm GMT.

![Example 2](/assets/images/2019-08-21/2.PNG)

Don't forget to set your timezone! If in the UK, change from UTC to UTC+0 (London) to account for British summer & daylight savings time.

We now an asset upload and deploy of the latest build to our test environment scheduled for 5pm daily.

# Scenario 2 - Deployment Approval

In this scenario, we extend the current release pipeline to add an approval to the 5pm deployment. It may be that the environment is in use in the evening, and we want to empower our Project Manager with the decision of whether or not to take the latest build.

The Approval will be added to Stage 1 of the Release Pipeline.

![Example 3](/assets/images/2019-08-21/3.PNG)

Click on Pre-development approvals to enable it, and expand the tab.

![Example 4](/assets/images/2019-08-21/4.PNG)

Type in the approvers names and save. I used a single approver for this example, but it is also possible to add multiple approvers. Multiple approvers also reveals the approval order option, which allows approval to be in any order, in sequence, or by a single approver.

![Example 5](/assets/images/2019-08-21/5.PNG)

Set the approval timeout to an hour, after which the approval will auto reject our deployment stage and save.

At the next scheduled release, the approvers will be emailed a prompt with a link to the release where the stage can be approved. Rather than triggering the deployment stage automatically as it did previously, the stage will be delayed until a user approves or rejects it, and it will be automatically rejected when the time runs out.

![Example 6](/assets/images/2019-08-21/6.PNG)

Follow the link, and click the approve button beneath Stage 1.

![Example 7](/assets/images/2019-08-21/7.PNG)

This opens the approval dialog, where the stage can be approved immediately or reassigned.

![Example 8](/assets/images/2019-08-21/8.PNG)

The approver also has the option to add a comment and chose to delay the start of the stage execution. In this example, we delay the deployment until 11pm.

![Example 9](/assets/images/2019-08-21/9.PNG)

Click approve, and at the specified time the package will be uploaded to LCS and Deployed.
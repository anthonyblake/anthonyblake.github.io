---
layout: post
title:  "Dynamics 365 F&O: Stopped (error) x++ Exception: cannot create a record in Alerts - Event inbox data (EventInboxData)"
date:   2024-10-15 16:30:00 +0000
categories: d365 finance sysadmin
tags: OData Axapta Integration Dynaimcs AAD DynamicsAx D365FO FinOpsDevOps App registration MSDyn365FO AXCommunityBlog EntraID D365 Dynamics365 MSDAX X++ DAX MSDyn365 Entra Dyn365 Dyn365FO SysAdmin D365 AAD Azure Active Directory DMF Postman System Admin SysAdmin Workflow
---

# Workflow Error!

![Workflow X++ Error](/assets/images/2024-10-15/2.png)

Today I'm sharing a fix I recently applied to a tier 2 sandbox Dynamics 365 F&SCM system deployed and running with Contoso demo data. 

![Workflow Stopped Error](/assets/images/2024-10-15/1.png)

Users reported all workflows, no matter what the record type, ending in the same error:

`Stopped (error) x++ Exception: cannot create a record in Alerts - Event inbox data (EventInboxData). Inbox ID: -some-record-id- . The record already exists`

I'm pretty sure this error is caused by the Contoso demo data shipping with some junk in the Event Inbox table. I haven't checked on a fresh Contoso demo dataset, so that assumption could be wrong. Regardless of why it occurred, it needed fixing. 

# The Fix 
The issue was reported on a tier 2 environment, if you are also running and looking to fix this on a tier 2, the first step is to gain access to the database. This guide will help you gain access from LCS:

[Dynamics 365 F&O: Gain Database Access on a Tier 2 Environment (LCS)](https://anthonyblake.github.io/d365/finance/sysadmin/2024/10/04/d365-sysadmin-lcs-tier2-db-access.html)

If you are fixing this on a cloud hosted dev environment, open up SSMS when connected to the VM by remote desktop, and connect to the local database.

Running the following query will give you a list of the event inbox rows which are causing duplication issues. Substitute the record ID with the record ID 1 digit less than the record ID in the workflow error above.

![View Event Inbox Records](/assets/images/2024-10-15/4.png)

```
SELECT TOP(1000) [DATA]
    ,[DATATYPE]
    ,[INBOXID]
    ,[RECVERSION]
    ,[RECID]
 FROM [dbo].[EVENTINBOXDATA]
 WHERE INBOXID > -the-recid-before-your-rec-id-
 ORDER BY INBOXID DESC
 ```

If this is a production environment, or for some other reason you need to take more care with this data, you should make sure you have a backup before this point. If it is contoso demo and you don't care (like I didn't), you can delete all the offending records. If this isn't a contoso demo data issue, this will hopefully be 1 or 2 records which nobody will miss from the event inbox, as its only really a notification, and not a critical transaction for workflow. If it is the contoso issue, you may have a lot of records over the offending RecId, and need to delete all of them. 

![Delete Event Inbox Records](/assets/images/2024-10-15/3.png)

```
DELETE FROM [dbo].[EVENTINBOXDATA] WHERE INBOXID > -the-recid-before-your-rec-id-
```

And thats it. The records which have used the RecID which workflow is trying to create in the Event inbox are deleted, and normal service can resume.

The final step is to head back to your workflow records in error, and click resume. 

![Resume Workflow](/assets/images/2024-10-15/5.png)

If everything has gone smoothly, the workflows stopped in error will all resume normally.


---
layout: post
title:  "D365 F&O Postman Workspace Additions September 2025"
date:   2025-09-02 09:15:00 +0000
categories: d365 finance integrations
tags: OData Axapta Integration Dynaimcs AAD DynamicsAx D365FO FinOpsDevOps App registration MSDyn365FO AXCommunityBlog EntraID D365 Dynamics365 MSDAX X++ DAX MSDyn365 Entra Dyn365 Dyn365FO SysAdmin D365 AAD Azure Active Directory DMF Postman
---

I have added 4 new & tested examples to the OData section of the Dyanamics 365 Finance APIs Postman Workspace. 

If you haven't used the Dynamics 365 Finance APIs Postman Workspace before, take a look, the new examples have been added to it, and it is a free to use community project, which is publicly accessible to copy, fork, download and experiment with here: [Postman: Dynamics 365 Finance APIs](https://www.postman.com/anthonyblakedev/workspace/dynamics-365-finance-apis){:target="_blank"}


## General Journal

![General Journal](/assets/images/2025-09-02/1.PNG)

## General Journal/GetLedgerJournalHeaders_CrossCompany

This reqeust returns all Ledger Journal Headers, for all legal entities.

![General Journal](/assets/images/2025-09-02/3.PNG)

Postman: [Dynamics 365 Finance APIs: Get Ledger Journal Headers](https://www.postman.com/anthonyblakedev/workspace/dynamics-365-finance-apis/request/22139284-6e229c0b-cf49-495f-a7e3-002e86d964ca?action=share&source=copy-link&creator=22139284){:target="_blank"}

Type: `GET`

Request: `{{resource}}data/LedgerJournalHeaders?cross-company=true`

## General Journal/PostLedgerJournalHeader_CrossCompany

This reqeust creates a Ledger Journal Header, with the Legal Entity and Journal Name specified in the Body.

![General Journal](/assets/images/2025-09-02/4.PNG)

Postman: [Dynamics 365 Finance APIs: Post Ledger Journal Header](https://www.postman.com/anthonyblakedev/workspace/dynamics-365-finance-apis/request/22139284-5f69e4cd-2c53-4038-84a6-d311c3d3b49a?action=share&source=copy-link&creator=22139284){:target="_blank"}

Type: `POST`

Request: `{{resource}}data/LedgerJournalHeaders?cross-company=true`

Body:

## Main Accounts

![General Journal](/assets/images/2025-09-02/2.PNG)

## Main Accounts/GetMainAccounts

This request gets all Main Accounts.

![Main Accounts](/assets/images/2025-09-02/5.PNG)

Postman: [Dynamics 365 Finance APIs: Get Main Accounts](https://www.postman.com/anthonyblakedev/workspace/dynamics-365-finance-apis/request/22139284-d634ffe8-8da4-42a3-93d6-1b70eeb5e316?action=share&source=copy-link&creator=22139284){:target="_blank"}

Type: `GET`

Request: `{{resource}}data/MainAccounts`

## Main Accounts/GetMainAccounts_FieldList

This request also gets all Main accounts, but returns a limited field list specified in the request parameters.

![Main Accounts](/assets/images/2025-09-02/6.PNG)

Postman: [Dynamics 365 Finance APIs: Get Main Accounts with Field List](https://www.postman.com/anthonyblakedev/workspace/dynamics-365-finance-apis/request/22139284-dd2589bc-c181-49bd-9001-95422aa9481e?action=share&source=copy-link&creator=22139284){:target="_blank"}

Type: `GET`

Request: `{{resource}}data/MainAccounts?$select=MainAccountId,IsSuspended,ActiveFrom,ActiveTo`



_The Dynamics 365 Finance APIs workspace is a public postman workspace created to bring together examples of the various methods of connecting to Dynamics 365 for Finance and Operations (SCM/HR), into one convenient and reusable place. Contact me via LinkedIn, Twitter, or Email using the details in the footer if you would like to contribute to the project. The workspace is available here: [Postman: Dynamics 365 Finance APIs](https://www.postman.com/anthonyblakedev/workspace/dynamics-365-finance-apis)_


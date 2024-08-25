---
layout: post
title:  "Dynamics 365 Finance and Operations: Create System Users and Advanced Customer Query Variation"
date:   2024-08-25 10:15:00 +0000
categories: d365 finance integrations
tags: OData Axapta Integration Dynaimcs AAD DynamicsAx D365FO FinOpsDevOps App registration MSDyn365FO AXCommunityBlog EntraID D365 Dynamics365 MSDAX X++ DAX MSDyn365 Entra Dyn365 Dyn365FO SysAdmin D365 AAD Azure Active Directory DMF Postman
---

There have been two additions to the D365 Finance OData workspace since my last post. The first is the addition of a POST example which creates a new user in System Administration -> Users. The second addition is a variation of the previous CustomersV3 queries using GET, which uses field lists, is cross company, and specifies the companies/legal entities to include in the returned dataset. 

The Postman Workspace is publicly accessible to copy, fork, download and use here: [Postman: Dynamics 365 Finance APIs](https://www.postman.com/anthonyblakedev/workspace/dynamics-365-finance-apis){:target="_blank"}

As usual, these examples are publicly accessible. Setup your environment variables, run the authentication step to obtain a bearer token, and test away. The examples are all created using the shipped Contoso demo data from MS.

## Add a System User via OData

![PostSystemUsers request in Postman](/assets/images/2024-08-25/2.png)

Postman: [Dynamics 365 Finance APIs: PostSystemUsers](https://www.postman.com/anthonyblakedev/workspace/dynamics-365-finance-apis/request/22139284-b0a4aad8-4f34-4c2c-baea-20505b54d482?action=share&source=copy-link&creator=22139284&active-environment=a6fe8359-b53f-49db-bd87-616db2899d1a){:target="_blank"}

Type: `POST`

Name: `PostSystemUsers`

Request: `{{resource}}data/SystemUsers`

Body: 
```
{
"UserID": "MyPostmanUserId",
"Alias":"MyUserId@MyDomain.com",
"Company":"GBSI",
"UserName": "MyPostmanUsername",
"UserInfo_language": "en-GB",
"Helplanguage": "en-us",
"EmailProviderID": "",
"AccountType":"ClaimsUser",
"NetworkDomain":"https://sts.windows.net/",
"Enabled":true
}
```
This request was created after a discussion with a colleague regarding the automation of System User creation via Postman. We discussed the AccountType field, and how intuition led us both to think ADUser would be the correct selection, however, for AAD/Entra, ClaimsUser is in fact the correct type. Thanks [Jim Willsher](https://www.linkedin.com/in/jiimwillsher/){:target="_blank"} for your input for this one.

![PostSystemUser body in Postman](/assets/images/2024-08-25/1.png)

The request body creates a user in the GBSI entity in the Contoso demo data. Without modification the request will only work once, as the second run will be rejected due to a duplicate key, UserID. 

## Query Customers Across Two Companies with a Field List

![GetCustomersV3 in the Postman Workspace](/assets/images/2024-08-25/4.png)

Postman: [Dynamics 365 Finance APIs: GetCustomersV3_FieldList_CrossCompany_GBSI_USSI](https://www.postman.com/anthonyblakedev/workspace/dynamics-365-finance-apis/request/22139284-92b3f85a-641a-48dd-8e00-d13539d96a41?action=share&source=copy-link&creator=22139284&active-environment=a6fe8359-b53f-49db-bd87-616db2899d1a){:target="_blank"}

Type: `GET`

Name: `GetCustomersV3_FieldList_CrossCompany_GBSI_USSI`

Request: `{{resource}}data/CustomersV3?$select=dataAreaId,CustomerAccount&cross-company=true&$filter=(dataAreaId eq 'USSI' or dataAreaId eq 'GBSI')`

![GetCustomersV3 request in Postman](/assets/images/2024-08-25/3.png)

This query was created in response to a question on the Dynamics Community Forums regarding reducing the response size when querying Customers across multiple compnaies. The query uses 3 techniques to query across all companies, reduce the size of the response, and remove any unneccessary data:

- Cross Company: query all companies.
- Field List: reduce the returned fields to a specified list, in this case only dataAreaId and CustomerAccount.
- Filters: only return data from the USSI and GBSI companies.

## Change Summary

The following updates and additions have been made to the Dynamics 365 Finance APIs Postman Workspace:

## Additions

# OData/Customers
- GetCustomersV3_FieldList_CrossCompany_GBSI_USSI

# OData/Users
- PostSystemUsers

## Updates

None

_The Dynamics 365 Finance APIs workspace is a public postman workspace created to bring together examples of the various methods of connecting to Dynamics 365 for Finance and Operations (SCM/HR), into one convenient and reusable place. Contact me via LinkedIn, Twitter, or Email using the details in the footer if you would like to contribute to the project. The workspace is available here: [Postman: Dynamics 365 Finance APIs](https://www.postman.com/anthonyblakedev/workspace/dynamics-365-finance-apis)_


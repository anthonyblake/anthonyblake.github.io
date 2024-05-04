---
layout: post
title:  "Dynamics 365 Finance and Operations: Public Postman Workspace for Integrations"
date:   2024-05-04 13:30:00 +0000
categories: d365 finance integrations
tags: OData Axapta Integration Dynaimcs AAD DynamicsAx D365FO FinOpsDevOps App registration MSDyn365FO AXCommunityBlog EntraID D365 Dynamics365 MSDAX X++ DAX MSDyn365 Entra Dyn365 Dyn365FO SysAdmin D365 AAD Azure Active Directory DMF Postman
---

Public Postman Collection: [Postman: Dynamics 365 Finance APIs](https://www.postman.com/anthonyblakedev/workspace/dynamics-365-finance-apis)

![D365 Postman Collection](/assets/images/2024-05-04/postman-collection-name.PNG)

There are vairous resources available for assisting developers and architects with connecting to Dynamics 365 for Finance, and plenty of tutorials on how to Authenticate and call the APIs, either via code or in Postman.

So far, I've yet to find a public Postman workspace containing authentication, OData examples, Package API examples, and Recurring Integration examples, all in one place.

![D365 Postman Collection - OData](/assets/images/2024-05-04/postman-collection.PNG)

I've created a public postman workspace to build a single point of reference for integration examples for D365 and DMF. Initially I've populated the workspace with a few OData GET examples, for Customers, Vendors, Exchange Rates and Products, plus some of the metadata services available.

![Postman Customers](/assets/images/2024-05-04/postman-get-customers-all.PNG)

It is available here: [Postman: Dynamics 365 Finance APIs](https://www.postman.com/anthonyblakedev/workspace/dynamics-365-finance-apis)

The workspace comes with a D365 environment which contains a number of environment variables to be completed to get started.

![Postman Environment](/assets/images/2024-05-04/postman-environment.PNG)

Set the local environment variables to the configuration for your D365 environment, run the Authentication step to obtain a bearer token, and test away.

If anyone is interested in contributing, please reach out via LinkedIn, Twitter, or Email. If not familair with Postman's collaboration tools, workspaces & collections can be forked and merged in a similar way to git, so its relatively easy with a little reading and trying it out.

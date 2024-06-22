---
layout: post
title:  "Dynamics 365 Finance and Operations: Public Postman Workspace Recurring Integrations"
date:   2024-06-22 12:30:00 +0000
categories: d365 finance integrations
tags: OData Axapta Recurring Integration Dynaimcs AAD DynamicsAx D365FO FinOpsDevOps App registration MSDyn365FO AXCommunityBlog EntraID D365 Dynamics365 MSDAX X++ DAX MSDyn365 Entra Dyn365 Dyn365FO SysAdmin D365 AAD Azure Active Directory DMF Postman
---

![Public Postman Workspace Updates](/assets/images/2024-06-22/1.png)

The Public Postman Workspace for the example in this article is available here: [Postman: Dynamics 365 Finance APIs](https://www.postman.com/anthonyblakedev/workspace/dynamics-365-finance-apis)

## Recurring Integration Examples

I've added a couple of recurring integration examples to the Public Postman Workspace. There is an example file for Customers which is Contoso USMF compatible, so its the best one to try out to get started.

## Customers Recurring Integration example

# Configure D365 & Postman

TO begin, the Environment variables need to be setup as the do for the OData examples If you already have the environment variables setup for OData, nothing to change.

In D365 DMF (Data management workspace), you will need to setup an Import Project for CustomersV3 in the format of XML-Element to use the sample file. Download the Sample file from postman, and use it as the template for import.

![Customers V3 Import Project](/assets/images/2024-06-22/3.png)

In the project, click the create recurring data job button:

![Create recurring data job button](/assets/images/2024-06-22/4.png)

Set the recurrance as you please, I usually setup these demos to run every 2-5 minutes. Also setup the Authorization Policy, this should match the App Id you have setup in Entra Id Applications, under System Administration in D365. I have also explicitly set the recurring job to be enabled, and under advanced options, Use company from message is toggle to On. Note the supported data source type is file, as the example uses an XML-Element formatted file. The final config should look something like this:

![Recurring integration manage recurrance](/assets/images/2024-06-22/5.png)

The ID highlighted above is important. Take a copy of it and paste it into the Collection Variable customersv3_activity_id, without the curly braces:

![Collection Variables](/assets/images/2024-06-22/2.png)

# Test the recurring job in Postman

Run the requests in the order they are presented:

- Authenticate - gets a bearer token from Entra Id to use for authentication for the other steps.
- Enqueue - Adds the file to the recurring integration message queue in D365.
- Get Message Status - Gets the status of the import. 
- Get Execution Id - Once message status is processed, run this to obtain the execution Id requrired for the call to get execution errors.
- Get Execution Errors - this will return the error log from the DMF job to import the customers. The array will be empty if there were no errors. The sample file doenst normally contain errors, so expect this to be blank.

Get message status result body will look like this when the XML is in the D365 queue waiting to be processed by the recurring job setup earlier:

![Message enqueued status](/assets/images/2024-06-22/6.png)

When processed by D365, the Get Message Status body will look like this:

![Message processed status](/assets/images/2024-06-22/7.png)

Check D365. You should have newly created customers, or updated customers in USMF if they already existed. 

If you have errors related to Customer Account Id, make sure the customer account sequence number is setup to allow manual entry in USMF.

Public Postman Collection: [Postman: Dynamics 365 Finance APIs](https://www.postman.com/anthonyblakedev/workspace/dynamics-365-finance-apis)

## Workspace Additions Summary

The following updates have been made to the Dynamics 365 Finance APIs Postman Workspace:

# Customers Recurring Integration
- Enqueue
- Get Message Status
- Get Execution Id
- Get Execution Errors

# General Journal Recurring Integration
- Enqueue
- Get Message Status
- Get Execution Id
- Get Execution Errors

## Updates

None


_The Dynamics 365 Finance APIs workspace is a public postman workspace created to bring together examples of the various methods of connecting to Dynamics 365 for Finance and Operations (SCM/HR), into one convenient and reusable place. Contact me via LinkedIn, Twitter, or Email using the details in the footer if you would like to contribute to the project._


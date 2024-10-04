---
layout: post
title:  "Dynamics 365 F&O: Gain Database Access on a Tier 2 Environment (LCS)"
date:   2024-10-04 18:15:00 +0000
categories: d365 finance sysadmin
tags: OData Axapta Integration Dynaimcs AAD DynamicsAx D365FO FinOpsDevOps App registration MSDyn365FO AXCommunityBlog EntraID D365 Dynamics365 MSDAX X++ DAX MSDyn365 Entra Dyn365 Dyn365FO SysAdmin D365 AAD Azure Active Directory DMF Postman System Admin SysAdmin
---

I recently encountered an issue which was blocking workflow, causing all workflows to enter an error state on assignement. The solution required the deletion of some records from the Contoso database on a tier 2 environment. 

The sun is setting on LCS as we head over to the PPAC, however I still think that the process to obtain access to the tier 2 (or above) database from LCS is worthy of a write up if it can help someone in the meantime. 

From LCS, JIT access to the database is available, and once we have credentials, we can use SQL Server Management Studio, SSMS, to connect to the database, find, and delete the offending records.

To connect, open the environment page of the tier 2+ environment in LCS. 

Step 1 is to add an IP rule, which can be done in LCS via Maintain -> Enable access.

![LCS enable access](/assets/images/2024-10-04/1.PNG)

Add an IP rule using your public IP address, specifically the public IP address of the environment you will connect from using SSMS.

Next, you need some JIT credentials to access the DB.

Under database accounts, click on the reason for access drop down. Select the most appropriate. I needed write access to delete some records, so I selected _Performance tuning for AX (write to AX)_.

![Request JIT access](/assets/images/2024-10-04/2.PNG)

Enter something in the details box, and click on the Request access button.

At this point, once the LCS page completes the request, the details may not display. Refresh the page in your browser to see the new JIT details.

![JIT details in LCS](/assets/images/2024-10-04/3.PNG)

We need to take 3 of the fields from the JIT details and populate 4 fields on the SSMS connection.

From the SQL Server\Database Name column, copy the contents out to notepad (or similar). Separate the server name from the database name at the \ character in the string.

Open SSMS.

![SSMS Connect to server](/assets/images/2024-10-04/4.PNG)

In the connect screen, paste the SQL server name (before the backslash). Change the authentication mode to SQL Server Authentication. Copy and paste the JIT username and password into the Login & PAssword fields.

Click on the Options>> button.

In connect to database, copy and paste the database name (after the backslash).

Finally click connect.

You now have access, albeit for the next 8 hours, to the tier 2+ SQL database. To continue over the 8 hour limit, repeat the JIT process in LCS. Also keep in mind ISPs occasionally change our public IPs if they are not static, so the enable access step may need to be repeated at some stage.



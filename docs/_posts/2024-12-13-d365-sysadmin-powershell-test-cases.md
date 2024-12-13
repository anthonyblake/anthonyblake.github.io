---
layout: post
title:  "Dynamics 365 F&O Apps: Automatically Create Azure DevOps Test Cases without LCS"
date:   2024-12-13 07:30:00 +0000
categories: d365 finance sysadmin
tags: OData Axapta Integration Dynaimcs AAD DynamicsAx D365FO FinOpsDevOps App registration MSDyn365FO AXCommunityBlog EntraID D365 Dynamics365 MSDAX X++ DAX MSDyn365 Finance Dyn365 Dyn365FO SysAdmin D365 D365FSCM F&SCM System Admin SysAdmin Azure DevOps PowerShell PS ps1 Dataverse
image: /assets/images/featured/featured-library-1.jpg 
author: "Anthony Blake"
---

## Overview

I have created a couple of PowerShell scripts to iterate a folder of D365 Finance and Operations developer XML task recordings, parse the XML for the test steps, and upload to an Azure DevOps project as new work items with the type Test Case. 

This is useful if you need to avoid using LCS, but want some automation in the creation of your Test Cases in Azure DevOps. This may be becuase you are using a BPM library not in LCS, or you may be using Power Platform to deploy your D365 environments rather than LCS, or even preparing for the near future where LCS will be deprecated.

The scripts are hosted on GitHub here: [https://github.com/anthonyblake/PSD365TestCaseUploader](https://github.com/anthonyblake/PSD365TestCaseUploader)

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![project_license][license-shield]][license-url]

The project contains 2 main PowerShell scripts.

`ADOTestCaseUploader.ps1`

This script connects to Azure DevOps via the API and uploads a single pre-formatted test case. 

`ADOUploadTestXmls.ps1`

This script is actually poorly named. It iterates a folder for XML files, which must be developer test XMLs generated from Dynamics 365 Finance and Operations Apps task recordings. For each XML, it opens and iterates the markup looking for test steps, which it adds to a payload ready to be uploaded to Azure DevOps as a test case. It then calls ADOTestCaseUploader to call the Azure DevOps API and upload a new work item with type test case, including a payload which contains the test case steps.

`AllowUnsignedScripts.ps1`

You may need to run the command in this file to allow you to run the unsigned PowerShell scripts in this repo.

```powershell
set-executionpolicy remotesigned
```
> This PowerShell script is currently crude. Files aren't cleaned up after uploading, and there is no error handling. If you are having issues, please reach out, but you may need to tweak the script for your needs.

## Prerequisites

- D365 Finance and Operations Apps instance, to create task recordings
- Azure DevOps personal access token

## Installation

Clone the repo
   ```sh
   git clone https://github.com/anthonyblake/PSD365TestCaseUploader.git
   ```

<!-- USAGE EXAMPLES -->
## Usage

From Dynamics 365 Finance and Operations Apps, create a number of task recordings using the Task recorder option.

![alt text](/assets/images/2024-12-13/1.PNG) 


Click +Create recording.

![alt text](/assets/images/2024-12-13/2.PNG) 


As you navigate and take actions in D365, the actions will appear as task steps in the task recorder. For the example I created a Vendor Group.

![alt text](/assets/images/2024-12-13/3.PNG) 


 At the end of each recording, click "Save as developer recording". This is the XML containing the test steps we need for Azure DevOps.

![alt text](/assets/images/2024-12-13/4.PNG) 


Save the recordings to the same folder as the PowerShell scripts from the GitHub repo.

![alt text](/assets/images/2024-12-13/5.PNG) 


Run the following PowerShell:

```powershell
#Upload D365 test cases to Azure DevOps
.\ADOUploadTestXmls.ps1 -organisation your_devops_org_name -project your_devops_project_name -pat azure_devops_personal_access_token
```
This will convert any XMLs in the source folder and upload them to Azure DevOps as test cases.

![alt text](/assets/images/2024-12-13/6.PNG) 


In Azure DevOps, your Test Cases will be created.

![alt text](/assets/images/2024-12-13/7.PNG) 


Open one of the test cases, and the steps will match the steps from the task recorder created earlier.

![alt text](/assets/images/2024-12-13/8.PNG)

## Summary

The PowerShell script is crude but effective, creating Test Cases in Azure DevOps in bulk via automation, without the need for LCS. If you find this useful, let me know via the contact details at the bottom of the page!


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/anthonyblake/PSD365TestCaseUploader.svg?style=for-the-badge
[contributors-url]: https://github.com/anthonyblake/PSD365TestCaseUploader/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/anthonyblake/PSD365TestCaseUploader.svg?style=for-the-badge
[forks-url]: https://github.com/anthonyblake/PSD365TestCaseUploader/network/members
[stars-shield]: https://img.shields.io/github/stars/anthonyblake/PSD365TestCaseUploader.svg?style=for-the-badge
[stars-url]: https://github.com/anthonyblake/PSD365TestCaseUploader/stargazers
[issues-shield]: https://img.shields.io/github/issues/anthonyblake/PSD365TestCaseUploader.svg?style=for-the-badge
[issues-url]: https://github.com/anthonyblake/PSD365TestCaseUploader/issues
[license-shield]: https://img.shields.io/github/license/anthonyblake/PSD365TestCaseUploader.svg?style=for-the-badge
[license-url]: https://github.com/anthonyblake/PSD365TestCaseUploader/blob/master/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/anthonyblakedynamics
[PowerShell-badge]: https://img.shields.io/badge/Built_with-PowerShell-blue
[PowerShell-url]: https://learn.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7.4

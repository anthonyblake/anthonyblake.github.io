---
layout: post
title:  "Dynamics 365 F&O Apps: Regularly Replace your Cloud Hosted Dev/Build Environments"
date:   2024-11-30 10:30:00 +0000
categories: d365 finance sysadmin
tags: OData Axapta Integration Dynaimcs AAD DynamicsAx D365FO FinOpsDevOps App registration MSDyn365FO AXCommunityBlog EntraID D365 Dynamics365 MSDAX X++ DAX MSDyn365 Finance Dyn365 Dyn365FO SysAdmin D365 D365FSCM F&SCM System Admin SysAdmin ER Electronic Reporting Config Dataverse
image: /assets/images/featured/featured-scrap-1.jpg 
author: "Anthony Blake"
---

# Overview

Cloud hosted environments are the original one-box deployment of a Dynamics 365 Finance and Operations Apps for developers, where everything needed to run the application is hosted on a single Virtual machine in an Azure subscription, and paid for on a consumption basis. They are also still used as build environments on some projects.

In some implementations, the environments are retained and maintained long-term, with LCS service updates applied to keep the platform version up to date with the rest of the project. It's good practice to kepe them updated, but the following scenarios are the reasons you should consider replacing them much more often.

# Scenario 1: Supported Software Versions

**Problem: Your cloud hosted dev environment is running unsupported versions of important software.**

Over time, the supported versions of software on cloud hosted environments is updated. This could be any of the components, and it needs the same level of maintenance as an on premise server. This maintenance takes valuable time and resources, and if your cloud hosted environment plan is correct, the most efficient way to update software versions is to provision a replacement.

This information is echoed in the Microsoft documentation here:

[Deploy and access development environments](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/dev-tools/access-instances)

![Software versions update advice in Microsoft Documentation](/assets/images/2024-11-30/1.png)

Check the latest supported software versions for Windows Server, Microsoft SQL Server, .Net framework runtime, and more, here: 

[Microsoft Dynamics 365 Finance + Operations supported software](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/deployment/onprem-compatibility)

**Solution: Delete and reprovision your Cloud Hosted Dev Environment!**

# Scenario 2: Troubleshooting Issues

**Problem: You have a problem with your cloud hosted dev environment that hinders your work.**

Anyone running cloud hosted envrionments for development, testing, or builds, will at some stage have encountered a technical issue. This could be building models in Visual Studio, applying the latest service updates, synchronising the database, or even connectivity. A quick look at the Dynamics Community Forums gives an idea of how often this happens, and how much time & resource is wasted investigating and trying to resolve problems. A typical cloud hosted environments can be provisioned in less than a working day, and if the environment strategy is for these environments to be disposable, as it should, many hours, or even days, of effort can be saved by provisioning a replacement early.

**Solution: Delete and reprovision your Cloud Hosted Dev Environment!**

# Scenario 3: Build Environments

**Problem: Your cloud hosted build environment needs maintenance after every service update.**

If your project is still utilising cloud hosted environments to run build agents for your Azure DevOps build pipelines, you may or may not know about the maintenance which is required on the environment every time a service or quality update is required.

In order to cleanup the PackagesLocalDirectory before every build, the build pipeline restores a copy of the vanilla application onto one of the local drives on the VM. The first build on a new build environment takes a much longer duration to complete because this backup is being created.

After a service or quality update, action is required to ensure the application is using the correct version for this restore process. The PackagesLocalDirectory folder should be cleaned up, so that no customisations exist, including built models and ISVs. Then the backup should be deleted, so that the next build using the build agent on this environment creates a new, vanilla backup for future builds and database synchronisations. This is a manual process, prone to error, and in many cases technical owners aren't even aware that it is needed. The quickest and safest way to maintain the build environments after an update, is to provision a new one!

**Solution: Delete and reprovision your Cloud Hosted Build Environment!**

# Summary

The new unified development experience will replace the need for cloud hosted environments for developers in the future, but while they are still in use on many projects, it's a really good idea to keep them up to date, and the most efficient and effective way to do that, is to provision replacements regularly. 

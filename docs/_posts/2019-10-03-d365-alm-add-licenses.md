---
layout: post
title:  "Azure DevOps Build & Release Pipeline for Dyn365FO - Add Licenses to Deployable Package Task"
date:   2019-10-03 08:45:00 +0000
categories: d365 finance alm
tags: Axapta Integration Dynaimcs AAD DynamicsAx D365FO FinOpsDevOps App registration MSDyn365FO AXCommunityBlog EntraID D365 Dynamics365 MSDAX X++ DAX MSDyn365 Entra Dyn365 Dyn365FO ALM Azure DvOps
---

![Add Licenses to Deployable Package Task](/assets/images/2019-10-03/LicenseAddOutput.jpg)

# Background

In this post, I will be focusing on the Add Licenses to Deployable Package Task, which is the second of the new tasks I have had the opportunity to try out. To read about the Create Deployable Package Task, take a look at my previous post;

[Azure DevOps Build & Release Pipeline for Dyn365FO - Create Deployable Package Task]()

Microsoft have released 3 new Azure DevOps tasks to support the upcoming preview of Azure DevOps hosted builds, which will enable building without a dedicated server hosting the build agent.
The tasks are;

- Create Deployable Package 
- Add Licenses to Deployable Package
- Update Model Version

![Add tasks from Dynamics 365 Finance and Operations Tools](/assets/images/2019-10-03/NewTasks.PNG)

*Add tasks from Dynamics 365 Finance and Operations Tools*

Information about all 3 new tasks has been posted on release by Microsoft's Joris de Gruyter here;

[Azure DevOps tasks for Packaging and Model Versioning](https://community.dynamics.com/365/financeandoperations/b/newdynamicsax/posts/azure-devops-tasks-for-packaging-and-model-versioning)

# Add Licenses to Deployable Package Task

As with the new Create Deployable Packages Task, the Add Licenses to Deployable Package Task brings immediate benefits. Rather than install our ISV Licenses in a seperate deployable package to the application, we can add them to the application deployable package as part of the Build or Release Pipeline.

For this example we will modify an existing build definition.

If you have already setup a release pipeline from any of my previous posts, the latest Tasks will already be installed on your Azure DevOps instance as part of Dynamics 365 Finance and Operations Tools, so I won't cover installing them, and assume they are already there.

If you are looking for how to install Dynamics 365 Finance and Operations Tools on your Azure DevOps instance, or how to set up an Azure DevOps Release Pipeline, then start here;

[Azure DevOps Release Pipeline for Dyn365FO - Part 1: Automated Package Upload & Deploy via LCS API]()
[Azure DevOps Release Pipeline for Dyn365FO - Part 2: Scheduled Releases with Approvals]()

Browse to Pipelines then Builds in Azure DevOps.

![Azure DevOps Pipelines](/assets/images/2019-10-03/PipelinesBuilds.PNG)

*Azure DevOps Pipelines*

At this stage I almost always click on the 3 dots in the top right and Clone the build definition before going any further.

![Clone a build definition](/assets/images/2019-10-03/CloneBuild.PNG)

*Clone a build definition*

Click on Edit on your original or cloned build definition.

With the build pipeline open for editing, browse the task Publish Artifact: Packages. 

![Publish Artifact: Packages](/assets/images/2019-10-03/PublishArtifactsHighlighted.PNG)

*Publish Artifact: Packages*

Click the + at the top of the build phase to add a new task;

![Add task to Build Phase](/assets/images/2019-10-03/PipelinesBuildsaddtask.PNG)

*Add task to Build Phase*

Search for Add Licenses to Deployable package, and add the task below.

![Add Licenses to Deployable Package Task](/assets/images/2019-10-03/AddLicensestoDeployablePackage.PNG)

*Add Licenses to Deployable Package Task*

We need to place the task to include the licenses just before publish. Drag the task to position it directly before Publish Artifact: Packages. In the example build definition I am modifying here, the task before is Copy Files to: Staging Directory. 

![Position the Add Licenses Task](/assets/images/2019-10-03/AddLicensesHighlighted.PNG)

*Position the Add Licenses Task*

There are 3 properties to set. Name can be anything.
Search pattern for license file to add to package is where we specify were to pick up the license text files.
I created a folder on the Service Drive of the Build box (likely to be K:) called licenses. In there I dropped 2 license files.

![Licenses as Text Files in Windows Explorer](/assets/images/2019-10-03/LicenseLocation.PNG)

*Licenses as Text Files in Windows Explorer*

Then set the search pattern to look in that location for any files, using *.

![Add Licenses to Deployable Package - Parameters](/assets/images/2019-10-03/Oldmethod.PNG)

*Add Licenses to Deployable Package - Parameters*

The filename and path of the deployable package should be set to one of the following examples. If your pipeline uses the old poweshell task for creating your deployable package;

```
$(Build.ArtifactStagingDirectory)\Packages\AXDeployableRuntime_7.0.5286.35426_$(Build.BuildNumber).zip
```

The filename in this case still needs to have the platform build number.

If you have moved to using the new Create Deployable Package Task, you can use the following;

```
$(Build.ArtifactStagingDirectory)\Packages\AXDeployableRuntime_$(Build.BuildNumber).zip
```

Using this method, the platform build number is no longer part of the package name.

![Add Licenses to Deployable Package - Parameters](/assets/images/2019-10-03/Newmethod.PNG)

*Add Licenses to Deployable Package - Parameters*

...that's the new Task setup complete. Run the build pipeline and get an output from the Add Licenses to Deployable Package task.

![Add License to Deployable Package Output](/assets/images/2019-10-03/LicenseAddOutput.jpg)

*Add License to Deployable Package Output*

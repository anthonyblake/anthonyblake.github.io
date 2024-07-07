---
layout: post
title:  "D365 Finance 10.0.40: Platform Update Preview Feature Hints at Copilot Future (it's already here)"
date:   2024-07-07 11:30:00 +0000
categories: d365 finance copilot
tags: Copilot API OData Axapta Integration Dynaimcs AAD DynamicsAx D365FO FinOpsDevOps App registration MSDyn365FO AXCommunityBlog EntraID D365 Dynamics365 MSDAX X++ DAX MSDyn365 Entra Dyn365 Dyn365FO SysAdmin D365 AAD Azure Active Directory DMF Postman
---

Following a recent platform update to D365 Finance 10.0.40, I noticed a new preview feature under feature management named "(Preview) Custom API Generation":

![(Preview) Custom API Generation](/assets/images/2024-07-07/1.png)

The name alone definitely captured my attention.

The description is:

_This preview feature enables exposing X++ functionality as CustomApi instances in the linked Dataverse environment, as well as generating the associated AIPlugin and AIPluginOperation artifacts._

Exposing X++ as Custom API instances in the linked datavase environment... cool. Then there are more clues, look at the naming of the associated artifcats which it generates. _AIPlugin_ and _AIPluginOperation_.

AIPlugin and AIPluginOperation are elements of Dataverse Copilot AI plugins. Read more about them here: [Building AI plugins for discovery by Copilot (preview)](https://learn.microsoft.com/en-us/power-apps/maker/common/build-ai-plugin-for-copilot)

So what we are looking at is exposing X++ functionality as AI Plugins in a Dataverse environment, supported out of the box. The feature is switched on by default, so it's a core part of the future Copilot AI path of the product, and the capabilites which are being unlocked by the new D365 [Unified Developer Experience](https://learn.microsoft.com/en-us/power-platform/developer/unified-experience/finance-operations-dev-overview). 

Clicking on _Learn More_ in feature management directs you to the documentation for extending Copilot in Finance and Operations Apps here: 

[Extend Copilot capabilities in finance and operations apps](https://learn.microsoft.com/en-gb/dynamics365/fin-ops-core/dev-itpro/copilot/extend-copilot)

From there, you can navigate through the guides including tutorials on how to create Copilot plugins.

![D365 Copilot AI Plugins documentation](/assets/images/2024-07-07/2.png)

[Create client plugins for Copilot in finance and operations apps](https://learn.microsoft.com/en-gb/dynamics365/fin-ops-core/dev-itpro/copilot/copilot-client-plugins)

Unlocking X++ code as Copilot AI plugins leads to huge possibilities, and is a real hint at the future direction of Copilot AI in the product. Imagine asking Copilot AI to post a Journal Batch, or run a recurring integration, from the Copilot interface, or even in the future through Microsoft Teams? Unlocking access to the power of X++ and business logic.



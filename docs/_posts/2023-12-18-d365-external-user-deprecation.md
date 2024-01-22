---
layout: post
title:  "Dynamics 365 Finance and Operations: Non-Azure AD external user sign-in Deprecation March 2024"
date:   2023-12-18 15:19:00 +0000
categories: d365 finance sysadmin
tags: Axapta Integration Dynaimcs AAD DynamicsAx D365FO FinOpsDevOps App registration MSDyn365FO AXCommunityBlog EntraID D365 Dynamics365 MSDAX X++ DAX MSDyn365 Entra Dyn365 Dyn365FO
---

From March 2024, Microsoft will begin restricting access to users of Dynamics 365 Finance and Operations to only allow users which exist in the same Azure Active Directory tenant. This is billed as having an impact on 3rd party tenant accounts which are not b2b onboarded, however there is a potential integration impact which I will cover later.

![Microsoft Deprecation Message](/assets/images/d365-finance-sysadmin-deprecated-march23.png)

This will affect any users from external tenants which are not also configured as guests in the host tenant for the D365 environment. These are the users where, for example, your tenant is contoso.com, but the F&O environment contains users which authenticate against my3rdpartytenant.com. These will be accounts which you see in your Users form with their own tenant suffixed on the provider. 

Microsoft have provided a link with clear instructions on how to implement guest accounts in Entra here: [Microsoft Learn: What is b2b? B2B collaboration overview](https://learn.microsoft.com/en-us/entra/external-id/what-is-b2b)

If an account is already guest on the F&O tenant, I don't believe any further action will be required in March 2024 when this is implemented.

# Potential integration impact
If you have integrations which require access to D365 F&O, you are likely to be implementing authentication via Azure app registrations, which link to a user for Authorisation in the System administration->Setup->Azure Active Directory applications form. 

![D35 AAD Applications](\assets\images\d365-finance-sysadmin-aad-applications.png)

In integration design, it is likely that the user assigned to the AAD app is not intended to be used for D365 login, so it may have been created in the users form and not necessarily imported from AAD/Entra as real users are. There is the potential (not tried, so not confirmed) that the upcoming changes to authentication could disable the account linked to the app registration and therefore, integrations would stop working.

The solution would be simple, to setup the linked D365 user ID in the Azure AAD tenant. 

If this turns out to be an issue for integrations will depend on how the deprecation is implemented. For integrations, these users are not used to authenticate, only to authorise by linking AAD client Ids to security roles, so there could be no action to take. It is possible this impact may go under the radar, so its one to look out for in March 2024.

The announcement of the deprecation is here: [Feature deprecation effective March 2024: Non-Azure AD external user sign-in](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/fin-ops/get-started/removed-deprecated-features-platform-updates#non-azure-ad-external-user-sign-in)
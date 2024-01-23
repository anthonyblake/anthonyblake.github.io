---
layout: post
title:  "Azure Logic Apps (Consumption): Create an Asynchronous API for Long Running Operations"
date:   2023-12-01 22:31:00 +0000
categories: azure logicapps
tags: Axapta Azure Dynaimcs DynamicsAx D365FO FinOpsDevOps MSDyn365FO AXCommunityBlog D365 Dynamics365 MSDAX X++ DAX MSDyn365 Dyn365 Logic Dyn365FO LogicApps
---

![Azure LogicApp Header](/assets/images/2023-12-01/azure-logicapps-httpconsumption-header.jpg)

Get the code for this demo on GitHub, including 1-click Azure deployment and postman collection for testing: [GitHub Project](https://github.com/anthonyblake/AZ-lac-AsyncDemo)

# Deploy the HTTP Async Demo Logic App 
[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fanthonyblake%2FAZ-lac-AsyncDemo%2Fmain%2Ftemplate.json)

# Background
An HTTP triggered logic app is a great tool for creating an API which performs a set of actions when called. When those actions involve interacting with other applications and waiting for processes to complete, the can become long running. An example could be loading a batch of data to a Dynamics 365 Finance recurring integration, which involves uploading, queuing, and polling the application for a result.

When adding a specific response to a logic app, by default, the HTTP trigger will run synchronously, where the caller waits for the logic app to complete before receiving a response. In a long running process scenario, we can design the logic app to run using an asynchronous pattern.

This is great in 2 specific scenarios:

- You want a return a response body from your Logic App to the API caller, without locking up a the callers session waiting for the long running App to complete.
- For a consumption app, you have a workflow which runs for over the timeout limit of 2 minutes.

![Async API Logic App](/assets/images/2023-12-01/azure-logicapp-AsyncLogicApp.drawio.png)

When running asynchronously, the Azure Logic App will send back an initial HTTP 202: Accepted response to the caller app, indicating that the request has been received and it is being processed. It also returns a URL in the Location header which can be used to poll the Logic App until completed. This will continue to return a 202 while the Logic App is running, when completed it will return the response defined in the workflow, usually a 200: OK, along with any body information from the call.

# Create an Asynchronous Logic App 
In Azure portal (because the example is a Consumption Logic App), create a new Logic App.

![Logic App Http Trigger](/assets/images/2023-12-01/azure-logicapp-LogicAppDesign1Trigger.png)

Add an HTTP request received trigger, on save the URL to trigger the logic app will be generated in the HTTP POST URL field.

Add a delay step to simulate the long running process. 

![Logic App Delay](/assets/images/2023-12-01/azure-logicapp-LogicAppDesign1Delay.png)

I went for a delay of 5 minutes, to prove that this Logic App remains responsive beyond the 2 minute consumption Logic App timeout, and to give me time to screenshot some responses.

Finally, add a response action. The status code I've chose for the example is 200 OK, and I've created a Json body containing a field called status, so we can see when the body is returned later.

![Logic App Response](/assets/images/2023-12-01/azure-logicapp-LogicAppDesign1Response.png)

The entire workflow should look like this.

![Logic App Workflow](/assets/images/2023-12-01/azure-logicapp-LogicAppDesign1.PNG)

At this point, running the workflow would return a timeout exception, because the response action would not be reached within the 2 minute timeout.

We need to modify the response to be Asynchronous. From the three dots menu on the Response step, click Settings.

![Azure Logc App Response Settings](/assets/images/2023-12-01/azure-logicapps-LogicAppDesign1ResponseSettings.png)

The second option in Settings is Asynchronous Response. Toggle it to be ON.

![Azure Logic Apps Response Toggle](/assets/images/2023-12-01/azure-logicapps-LogicAppDesign1ResponseSettings2.png)

# Test the Workflow
The workflow is all set to return an Accepted response and be polled until complete. The best place to test it is in Postman.

In a new or existing collection, create a new HTTP post request using the URL generated when saving the HTTP request trigger in the Logic App earlier.

![Postman Test Trigger](/assets/images/2023-12-01/azure-logicapps-LogicAppTestTrigger.png)

Hit the Send button. The response should be a 202 Accepted.

![Postman Test Response](/assets/images/2023-12-01/azure-logicapp-LogicAppTestLocation.png)

The location header in the 202 response contains the URL to poll for the status of the running logic app. If can be copied and pasted manually into a new GET request each time the logic app runs, or we can automate that using the Tests tab and an environment variable.

Create a new environment or modify an existing environment, and add the variable get_status_url;

![Postman Test Environment](/assets/images/2023-12-01/azure-logicapps-LogicAppTestEnvVar.png)

To store the status URL from the location header, add the following code under the Tests tab of the initial request:

![Postman Environment Variable Store](/assets/images/2023-12-01/azure-logicapps-LogicAppTestEnvVarStore.png)

Copy and paste version:

```
pm.environment.set("get_status_uri", pm.response.headers.get("Location"));
```

Create a GET request, and for the URL use the environment variable get_status_url in double braces:

![Postman Get Status URL](/assets/images/2023-12-01/azure-logicapps-LogicAppTestEnvStatus.png)

If the get request is called within the 5 minute delay, so while the Logic App is executing it's long running process, the response will continue to be a 202 Accepted, with a body containing the the status Running in the properties object.

![Postman Running Status](/assets/images/2023-12-01/azure-logicapp-LogicAppTestEnvStatusRunning.png)

Click send and poll the Logic App multiple times during the long running process. The response will remain a 202 Accepted until the Logic App completes, when a 200 OK will be returned, along with the body we defined in the Response step of the Logic App.

![Postman Status Completed](/assets/images/2023-12-01/azure-logicapp-LogicAppTestEnvStatusOK.png)

Done. An Asynchronous solution to allow Consumption Logic Apps to run for longer than 2 minutes, transferable to Standard Logic Apps to prevent caller threads being blocked, and potentially timed out, by long running processes.

Please leave a comment below if this has been useful - all feedback welcome.

Get the code for this demo on GitHub, including 1-click Azure deployment and postman collection for testing: [GitHub Project](https://github.com/anthonyblake/AZ-lac-AsyncDemo)

# Deploy the HTTP Async Demo Logic App 
[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fanthonyblake%2FAZ-lac-AsyncDemo%2Fmain%2Ftemplate.json)

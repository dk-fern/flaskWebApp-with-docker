# Step 3: Infrastructure as Code with Terraform
Infrastructure as Code (IaC) allows IT professionals to create cloud infrastructure using a programming language. Infrastructure like servers, networks, databases (and more) are defined, configured, and managed all using a high-level coding language and configuration files. Using IaC ensures your cloud infrastructure maintains the correct configuration you desire while also allowing automation. 

In essence, rather than logging into an online portal and manually clicking to configure your cloud infrastructure, you can create configuration files using special coding languages, run them, and your cloud infrastructure will be created.

## Terraform
[Terraform](https://www.terraform.io/) is an open source tool created by HashiCorp, which allows for the provisioning of infrastructure resources across various cloud providers and on-premises environments using declarative configuration files. [Terraform's documentation](https://developer.hashicorp.com/terraform?ajs_aid=0fd2f30a-4d91-4a28-b55f-82b4589a8031&product_intent=terraform) is great, well written, and really provides all you need for just about any project you can think of.

## Cloud Computing
According to [Zippia](https://www.zippia.com/answers/what-percentage-of-companies-use-cloud-services/) as of 2022, 94% of businesses used the cloud in some way, and this number is only growing. Cloud providers allow the ability to quickly create IT infrastructure that is flexible and scalable to business needs. With that being said, understanding the cloud in some way is a must for IT professionals. If you haven't already, I encourage you to continue cloud learning. And if I had to suggest one resource, I used [Learn Azure in a Month of Lunches](https://info.microsoft.com/ww-landing-learn-azure-in-a-month-of-lunches.html) which is free and does a great job explaining concepts well and giving hands on experience in Azure.

## Azure
Though IaC and Terraform can be used across several cloud providers, for this project we'll be using Microsoft's Azure. I personally find Azure to balance, ease of use and functionality, with a ton of features to create anything from personal projects to enterprise sized applications. As an added bonus, Azure will give you some free credit to use in the first month of creating an account, and give your new account some free services for a whole year!

If you're new to Azure, I'll quickly explain what the structure of our web application will look like. Everything in Azure exists as a resource in a **"Resource Group"**. So a Linux virtual server is a resource, a virtual network is a resource, a public IP address is a resource, etc. And resources within a Resource Group can be connected together as needed or exist independently. For our purposes (as seen in the diagram below), we will be using Azure's Web Application PaaS (if you don't know much about what this means, see [HERE](https://www.ibm.com/topics/iaas-paas-saas) for more information) service. Because it's a *"Platform as a Service"*, the underlying infrastructure of what a web application needs is handled by Azure, we just have to provide the code/container needed for a web application. Nice and easy!

Additionally, our web application will sit inside of an *"App service plan"* (something needed to run a web app that defines where our web app will live, computing power size, etc), and that app service plan will sit inside of a *"Resource Group"*. See the diagram below for a visualization.

![azure diagram](https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/585cc191-9dff-498d-b0e7-ab347577fad4)


**Let's get started!**

# Get set up:

## 1. Download Terraform
Download the latest version of Terraform [HERE](https://developer.hashicorp.com/terraform/install?ajs_aid=0fd2f30a-4d91-4a28-b55f-82b4589a8031&product_intent=terraform). Rather than a program to install, Terraform exists as an executable. There are a couple of ways to do this, but here is what I've found to work well, and what others online suggest as well:
- Open the folder than downloads to find *"terraform.exe"*. 
- Open *File Explorer* and under ***"This PC"*** select ***"Windows (C:)"*** to navigate to your root **"C:\"** drive. Create a new folder there called ***"Terraform"***.
- Drag and drop *terraform.exe* into our new *Terraform* folder.
- Navigate to your environmental variables. This can be done a number of ways, one of which being in your start menu, begin typing "environmental variables" and it should come up
    <img width="261" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/8eb556f9-a7d9-4b3f-b958-ab4d4b7684f8">

- Select *"Environment Variables"*, then under *"System variables"* fine the variables named ***"Path"***. Select it and click *"Edit"*
    <img width="304" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/7a963bcf-5eec-4e46-892d-be897457aa39">

    <img width="434" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/baad7eea-72f9-419d-9093-6cd3f91dbad2">

- Create a *"New"* path to the folder we just created: `C:\Terraform`
- Hit *"OK"* to everything and close out the Environmental Variables window.
- Test that it worked: Open a terminal in VS Code (*Remember: **Terminal** > **New Terminal***) and type: `terraform --version`. If you get a version number and not an error message, then congrats! You've finished this step.
    <img width="634" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/3cb900aa-4f7c-485d-8d21-da86012d0614">


## 2. Create a free Azure account
- Navigate to this link: [Azure Free Account](https://azure.microsoft.com/en-us/free)
    <img width="1198" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/be3cd69d-2215-4b0d-94d8-79d16e522b5e">

- When signing up you will have to add a credit/debit card to your account, but you won't initially be charged for anything, and you will be given $200 free credit to use. Even after my free credit ran out, I still have never been charged for resources because Azure provides *"free tier"* resources that won't charge you.

> [!NOTE]
> A key component to cloud computing is being good at cleaning up resources that aren't in use. Deleting resource groups and resources you don't need anymore is good practice.

## 3. Link your Terraform to your Azure subscription
For this one, I am just going to link the [Terraform guide for setting up Azure with Terraform](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build). Rather than writing the how-to myself, HashiCorp has done a great and clear job explaining the process and most of it can be copy/pasted for you.

As a quick overview, in the tutorial you will:
- Install the Azure CLI tool
- Create a service principal which gives Terraform permission to interact with your Azure account

**STOP AND COME BACK JUST BEFORE THE SECTION TITLED: *Write Configuration***

It's simple, and continues to give more and more learning practice and hands-on experience.

<img width="559" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/93fc71f5-2548-4534-8494-c92af7d142d2">


# Create your Terraform files


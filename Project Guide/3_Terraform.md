# Step 3: Infrastructure as Code with Terraform
Infrastructure as Code (IaC) allows IT professionals to create cloud infrastructure using a programming language. Infrastructure like servers, networks, databases (and more) are defined, configured, and managed all using a high-level coding language and configuration files. Using IaC ensures your cloud infrastructure maintains the correct configuration you desire while also allowing automation. 

In essence, rather than logging into an online portal and manually clicking to configure your cloud infrastructure, you can create configuration files using special coding languages, run them, and your cloud infrastructure will be created.

## Terraform
[Terraform](https://www.terraform.io/) is an open source tool created by HashiCorp, which allows for the provisioning of infrastructure resources across various cloud providers and on-premises environments using declarative configuration files. [Terraform's documentation](https://developer.hashicorp.com/terraform?ajs_aid=0fd2f30a-4d91-4a28-b55f-82b4589a8031&product_intent=terraform) is great, well written, and really provides all you need for just about any project you can think of. We'll be talking more about Terraform in just a bit.

## Cloud Computing
According to [Zippia](https://www.zippia.com/answers/what-percentage-of-companies-use-cloud-services/) as of 2022, 94% of businesses used the cloud in some way, and this number is only growing. Cloud providers allow the ability to quickly create IT infrastructure that is flexible and scalable to business needs. With that being said, understanding the cloud in some way is a must for IT professionals. If you haven't already, I encourage you to continue cloud learning. And if I had to suggest one resource, I used [Learn Azure in a Month of Lunches](https://info.microsoft.com/ww-landing-learn-azure-in-a-month-of-lunches.html) which is free and does a great job explaining concepts well and giving hands on experience in Azure.

## Azure
Though IaC and Terraform can be used across several cloud providers, for this project we'll be using Microsoft's Azure. I personally find Azure to balance, ease of use and functionality, with a ton of features to create anything from personal projects to enterprise sized applications. As an added bonus, Azure will give you some free credit to use in the first month of creating an account, and give your new account some free services for a whole year!

If you're new to Azure, I'll quickly explain what the structure of our web application will look like. Everything in Azure exists as a resource in a **"Resource Group"**. So a Linux virtual server is a resource, a virtual network is a resource, a public IP address is a resource, etc. And resources within a Resource Group can be connected together as needed or exist independently. 

For our purposes (as seen in the diagram below), we will be using Azure's Web Application PaaS (if you don't know much about what this means, see [HERE](https://www.ibm.com/topics/iaas-paas-saas) for more information) service. Because it's a *"Platform as a Service"*, the underlying infrastructure of what a web application needs is handled by Azure, we just have to provide the code/container needed for a web application. Nice and easy!

Additionally, our web application will sit inside of an *"App service plan"* (something needed to run a web app that defines where our web app will live, computing power size, etc), and that app service plan will sit inside of a *"Resource Group"*. See the diagram below for a visualization.

![azure diagram](https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/585cc191-9dff-498d-b0e7-ab347577fad4)


**Let's get started!**

# Get set up:

## 1. Download Terraform
Download the latest version of Terraform [HERE](https://developer.hashicorp.com/terraform/install?ajs_aid=0fd2f30a-4d91-4a28-b55f-82b4589a8031&product_intent=terraform). Rather than a program to install, Terraform exists as an executable. Now let's add the Terraform executable to our *Path* so it can be ran directly from the command line. There are a couple of ways to do this, but here is what I've found to work well, and what others online suggest as well:
- Find *"terraform.exe"* in your Downloads folder, or wherever else you may have saved it. 
- Open *File Explorer* and under ***"This PC"*** select ***"Windows (C:)"*** to navigate to your root **"C:\"** drive. Create a new folder there called ***"Terraform"***.
- Drag and drop *terraform.exe* into our new *Terraform* folder.
- Navigate to your environmental variables. This can be done a number of ways, one of which being in your start menu, begin typing "environmental variables" and it should come up

  <img width="261" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/8eb556f9-a7d9-4b3f-b958-ab4d4b7684f8">

- Select *"Environment Variables"*, then under *"System variables"* fine the variables named ***"Path"***. Select it and click *"Edit"*
    <img width="304" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/7a963bcf-5eec-4e46-892d-be897457aa39">

    <img width="434" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/baad7eea-72f9-419d-9093-6cd3f91dbad2">

- Click ***"New"*** and add `C:\Terraform` to your ***"Path"*** variable.
- Hit *"OK"* to everything and close out the Environmental Variables window.
- Test that it worked: Open a terminal in VS Code (*Remember: **Terminal** > **New Terminal***) and type: `terraform --version`. If you get a version number and not an error message, then congrats! You've finished this step.
    <img width="634" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/3cb900aa-4f7c-485d-8d21-da86012d0614">


## 2. Create a free Azure account
- Navigate to this link: [Azure Free Account](https://azure.microsoft.com/en-us/free), and select **"Start free"**
    
    <img width="1198" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/be3cd69d-2215-4b0d-94d8-79d16e522b5e">

- When signing up you will have to add a credit/debit card to your account, but you won't initially be charged for anything, and you will be given $200 free credit to use. Even after my free credit ran out, I still have never been charged for resources because Azure provides *"free tier"* resources that won't charge you.

> [!NOTE]
> A key component to cloud computing is being good at cleaning up resources that aren't in use. Deleting resource groups and resources you don't need anymore is good practice.

## 3. Link Terraform to your Azure subscription
We will need to now created a [*"Service Principal"*](https://learn.microsoft.com/en-us/entra/identity-platform/app-objects-and-service-principals?tabs=browser#service-principal-object) within our Azure account that gives Terraform the permissions needed to interact with our Azure account. We'll be doing this from the command line using the Azure powershell library. 

For this one, I am just going to link the [Terraform guide for setting up Azure with Terraform](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build). Rather than writing the how-to myself, HashiCorp has done a great and clear job explaining the process from downloading the Azure powershell library, to all the commands needed to set this up, and most of it can be copy/pasted for you.

As a quick overview, in the tutorial you will:
- Install the Azure CLI tool
- Create a service principal which gives Terraform permission to interact with your Azure account

**STOP AND COME BACK JUST BEFORE THE SECTION TITLED: *Write Configuration***

The guide simple, and continues to give more and more learning practice and hands-on experience.

<img width="559" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/93fc71f5-2548-4534-8494-c92af7d142d2">


# Create your Terraform files
Before we actually get hands-on-keyboard with this part, let's understand Terraform a bit. Again, before explaining myself, I'll link two resources for you to read after this project for deeper learning:
- [Terraform general documentation](https://developer.hashicorp.com/terraform/cli)
- [Azure with Terraform- get started](https://developer.hashicorp.com/terraform/tutorials/azure-get-started)

HashiCorp really does a great job with their documentation for Terraform, and after this project if Infrastructure as Code is something you enjoy, I would recommend you dive deeper into it because we are really only scratching the surface.

## Terraform Layout and Structure
I'll just attempt to begin explaining Terraform in a way that feels beneficial to this project:

### Folder structure
You'll notice in our ***"flaskWebAppTerraform"*** folder we just have two files named *"main.tf"* and *"variables.tf"*, these are just standard naming conventions but anything inside of our root Terraform directory will be used by Terraform when the configuration is ran. For example, inside of the ***flaskWebAppTerraform*** folder we could have more folders for different purposes and for organizing more complex IaC projects. When we run Terraform, it will look for any *".tf"* file in our root Terraform folder (***flaskWebAppTerraform*** in our case) and any sub folders and assume they are in the same project. More info on folder structure can be found in Terraform's documentation [HERE](https://developer.hashicorp.com/terraform/language/files).

### Providers
Terraform uses *"providers"*, to help make the program work. What providers are, are cloud-service specific plugins that are installed when we first initialize Terraform (that will be explained shortly). When we run that initialization command to start our project, Terraform will download the Azure plugin (because we'll tell it to at the beginning of our *"main.tf"* file) which is what translates our Terraform files into API calls to Azure, thus creating the cloud infrastructure. If this feels confusing, you really don't need to understand it too much for this project, but deeper explanation can be found in Terraform's documentation [HERE](https://developer.hashicorp.com/terraform/language/providers).

### Declarative coding language
Terraform uses a specific coding language called [HashiCorp Configuration Language](https://developer.hashicorp.com/terraform/language). This is a ***declarative*** coding language, meaning, rather than using code to write the steps of how a computer should do something, you simply *declare* what you want the end product to be, and Terraform makes it happen. As a contrast, other languages like Python are called *procedural* coding languages as you have to write step-by-step what needs to happen to get your end result.

### Terraform CLI
Using Terraform from the command line consists of a few steps (don't run these quite yet, we'll do that soon):
- `terraform init`: This command will initialize Terraform for our project (as mentioned earlier). After we run this command Terraform will download the Azure provider module, and create some new things in our root folder (see below, after running `terraform init` there is more in our directory than just the two config files)

  <img width="514" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/c21d4063-7c9c-41ba-b084-47247a2f7d4c">

    These new files are both used to allow Terraform to run from here on, but also creates *"state"* files that keep track of the current state of our cloud infrastructure. From a security perspective, you don't want these newly created files to be public, so make sure if you upload this project to Github or anywhere else, don't include these.

> [!NTOE]
> Though there may be times `terraform init` may be re-ran, it generally only needs to be ran once per project.

- `terraform fmt`: You may notice while looking at *"main.tf"* that it is very neat in the sense that the columns are aligned and formatted well. Thankfully you don't have to do this yourself. Running this command will automatically clean up your config files and make them pretty.

- `terraform plan`: Running this command will tell you what's going to happen without making it happen. When we run it, Terraform will say what cloud resources are being created, modified, or destroyed, as well as provide any errors or problems with your config files. This command is helpful and I reccomend running it always before the next command to be sure you know what will happen in your cloud environment.

- `terraform apply`: This is the command that will actually create the resources. If you run `terraform plan` first, you will get the same output when running `terraform apply`. Additionally, you will be prompted to type *"yes"* that you really want to run the ***apply*** command.

- `terraform destroy`: Finally, as mentioned before, we always want to clean up our cloud resources when we don't want them anymore. Running `terraform destroy` will delete any resources in the config files. You will again be prompted to type *"yes"* that you really want to destroy the items.

- Lastly, because using Terraform (and other IaC tools) relies on configs and state files to know what is true about your cloud environment, manually adjusting things inside of the Azure portal may *break* your Terraform *"state"* because there is no way for the state files to be updated. If you did something like removed a resource manually, then tried to update your Terraform configs and run them, you would get an error. If this happens to you, I recommend manually removing the full resource group in the Azure portal [HERE](https://portal.azure.com) (which in turn automatically removes the resources in it) and re-running Terraform.

## Hands-On (finally)
Now let's get hands-on with Terraform. In the project folder navigate to the ***"flaskWebAppTerraform"*** folder this is our root Terraform folder discussed earlier. Inside of that you should see two files
- **main.tf**
- **variables.tf**

First, open the main file either by selecting it in the *"Explorer"* windows, or running `code main.tf`. I won't be explaining every line of the file, but I'll explain a few things for the sake of understanding what is happening and getting an overall understanding of Terraform:

- Lines 1-12 are what tells Terraform to install the correct Azure provider.
- You'll notice on lines 14, 19, and 32 is **"resource"** followed by some names in "quotes". Terraform uses things called *"resource blocks"* that are chunks of code *declaring* (remember Terraform uses a *declarative* coding language) what you want to be built.
  Let's take a look at one of these resource blocks as an example:
  ```hcl
  resource "azurerm_service_plan" "service-plan" {
      name                = var.app_service_plan_name
      location            = var.resource_group_location
      resource_group_name = var.resource_group_name
    
      os_type  = "Linux"
      sku_name = "F1"
    
      depends_on = [
        azurerm_resource_group.rg,
      ]
    }
  ```

    The first line declares what this block is:

    - `resource` declares that this is a resource. Examples of other things that can be declared are `output` (as seen on line 56) or `variable` as seen in *"variables.tf"*

    - `"azurerm_service_plan"` is a Terraform specific term that the Azure provider knows means that we want an Azure App Service plan
      
    - `"service-plan"` is the name of this block inside of our config if we need to reference it later, and can be named whatever you want. Don't worry too much about this concept, but if you wanna read more about it, do so [HERE](https://developer.hashicorp.com/terraform/language).
      
    - All other aspects of this resource block are called *"arguments"* that fall within the brackets `{ }` and define other qualities of our resource we want to create including what it should be named within Azure, the type of operating system, the size, etc. Because we are using a ***"variables.tf"*** file, many of these things are called `var.____`. This makes our config more dynamic and means we don't have to type the same thing over and over again.

You won't have to adjust anything in ***"main.tf"***, we are just taking a look at it to better understand Terraform as a whole. If you want to learn more, there is great documentation to use in future projects. If there is any sort of Azure resource you need, the documentation shows exactly what what needs to declared and what other resource blocks are needed. See the documentation for the Web Application resource we are using in this project [HERE](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app). Also see ***Examples folder*** on the [Github Page](https://github.com/hashicorp/terraform-provider-azurerm) for the Azure Terraform provider for some pre-created examples.

> [!NOTE]
> In the service plan, the sku_name refers to the underlying compute size that your web application will use. "F1" is a free tier size which is pretty weak, but because our web app is static (meaning it doesn't take or move any data), it should be fine. It also means we don't have to pay!

### NEXT: 
Now let's open *variables.tf* by either selecting it in the Explorer window or running `code variables.tf`. Here is where you will be putting in your own information to make this Terraform config your own (I know this took forever, but it really is important to understand most of this stuff).

```terraform
variable "resource_group_name" {
  default = "<resource group name>"
}

variable "resource_group_location" {
  default = "westus3"
}

variable "app_service_plan_name" {
  default = "<service plan name>"
}

variable "web_app_name" {
  default = "<web app name>"
}

variable "docker_image_name" {
  default = "<your docker image>"
}
```

In each variable block substitute the value in the `<___>` for your own value, contained in "quotation" marks. You can name things whatever you want, but I would recommend them being somwhat descriptive (for example, naming the service plan something like: *"flask_service_plan"*). I've pre-defined the location to be *westus3* which can be kept for simplicity sake. 

***Example of a completed service plan variable block:***
```terraform
variable "app_service_plan_name" {
  default = "flask_app_service_plan"
}
```


Additionally, the value you put for `<web app name>` needs to be globally unique and will ultimately be a part of our URL to access the app. You may get an error if your web app name is already in use. I'll also note (for the sake of security) that in the name I chose for my web application- ***dfern1978***, the ***1978*** part is not relevant to me at all, it's just numbers chosen to make my web app globally unique.

With everything in place, let's run our web app!

# Running your web app
Remember those few Terraform commands we listed before? Now we get to use them! Open your terminal, navigate to your Terraform folder (remember, use `cd <folder_name> to move to that folder in your terminal` and run these commands:

1. `terraform init`: This will initialize Terraform for our project and will create a few new things in our Terraform folder
2. `terraform fmt`: This formats our .tf files if needed. If you get an output, that means that file was formatted in some way. If you don't get an output that means everything is formatted correctly
3. `terraform plan`: This may take a moment to run, but will show us what resources will be created. If any errors arise, you may need to troubleshoot at this stage.
4. `terraform apply`: This will push our config files to the cloud and create our web application. You will be prompted if you want to continue at some point, type "yes", then Terraform will work to create your web app.

<img width="414" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/66533d5f-ad29-44c3-8708-5e343d09bfbd">

### Output
You should see in your terminal after the ***apply*** finishes, there is a URL (see above image). This is the URL to your application! Navigate to it now (see note below about loading times) You can also view this in the Azure portal by:
1. Navigate to [portal.azure.com](https://portal.azure.com) and log-in if needed.
2. Select **"Resource groups"** (if it isn't present on the home screen, search for it in the search bar at the top of the page)
3. Select your resource group
4. Select your web application (the web app is the one with this symbol <img width="22" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/42a55fe7-8d1b-4946-8e34-f8317d0ca970"> and the *"type"* named **"App Service"**
5. In the **"Overview"** page (it should be the page you automatically land on), look for ***"Default domain"***. This is your domain to navigate to.

<img width="237" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/35d2c086-7e51-4848-b722-dc0c1c3babfb">

### A note about load times:
We are using a free tier sku with very low compute power behind it. Additionally by Terraform's own admission [HERE](https://github.com/hashicorp/terraform-provider-azurerm/blob/main/examples/app-service/docker-basic/README.md), deploying a Docker container to a web application takes a while to load. I have found that selecting the URL and letting the page load until it errors-out, then re-loading and waiting a little bit more is enough for the page to get working. Overall I'd give it a few minutes of patience before we are met with our web application: 

<img width="1187" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/e6889ade-eb24-4331-a711-da956d93056c">

Note the URL I am at in the above screenshort meaning that this website is being hosted in Azure and not locally.

## Great Job!
If you made it to this point, you have successfully deployed your web application to the cloud using Terraform, and you have come to the end of our project. Take a look at [4_Next_steps](https://github.com/dk-fern/flaskWebApp-with-docker/blob/main/Project%20Guide/4_Next_Steps.md) for a project conclusion and some resources to continue learning about these topics.

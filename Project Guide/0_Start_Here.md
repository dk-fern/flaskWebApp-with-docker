# Project Overview
## What is this project?
This project creates a "resume style" static web application (meaning it doesn't transmit data to or from it) with the Python web application framework, Flask. It then containerizes that application with Docker and stores it on Docker Hub. The container is then deployed to an Azure Web Application using Terraform.

## What this project demonstrates?
### Development
Though the application is already built and not much Python knowledge is needed to make it your own, we will still walk through the basics of how [**Flask**](https://flask.palletsprojects.com/en/3.0.x/) works and I'll be pointing you towards documentation to read. You will however have to dig through a bit of HTML to customize the website, giving you exposure to both HTML and Python. While web application development isn't needed for a career in IT, Python continues to prove to me to be an invaluable skill to know and I encourage anyone in IT to learn it.

### Docker
Containerization has revolutionized the modern IT environment by providing a lightweight, isolated, and consistent runtime environment for applications. It allows developers to package an application with all of its dependencies (all the extra pieces and libraries needed to run an application) into a standardized unit for software development. This not only simplifies deployment but also enhances scalability and efficiency. [**Docker**](https://www.docker.com/) is the leading platform in this space, and has been instrumental in popularizing containerization. Docker is easy to use, open source, and has a huge community behind it.

In this project I'll show and explain how to create a simple Docker container for your web application and keep it in your own Docker Hub repository.

### Terraform
Infrastructure as Code (IaC) is a key practice in modern IT and cloud/hybrid environments, and [**Terraform**](https://www.terraform.io/) is one of the top tools for it. IaC allows teams to define cloud infrastructure using code rather than through a web browser or command line. Terraform's declarative configuration language will automatically validate a cloud infrastructure's state (I'll explain more about that later).

### A note about security
The things we are doing in this project are going to be publicly hosted online. Please don't put private information (full names, addresses, workplace specifics, phone numbers, etc) online.

### Before we begin
Depending on your experience level, some of this may be frustrating. You may even get stuck somewhere along the way. If that happens, I encourage you to keep moving forward, troubleshoot your problems online, or use other tools like ChatGPT to help (not always 100% accurate but still super useful). Your whole IT career you will have to use research to find the answers to your problems so I encourage you to do so in this project. Additionally, if you have means to reach out to me and ask questions, I'm always happy to help.

## Next steps
Before we start anything, download the repository to your computer. It doesn't matter where that folder sits, but it is going to be your working project space. The non-git/simplest way to do that is to select the green **"Code"** button from the main repository page and choose **"Download Zip"**, then extract the files to a folder on your computer:

![image](https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/1c8cbe12-c777-4934-a0dd-4603ae394d6a)


Our first step is to set up our web application. Follow the guide for that here: [**1. Flask Guide**](https://github.com/dk-fern/flaskWebApp-with-docker/blob/main/Project%20Guide/1_Flask.md)

# Project Overview
## What is this project?
This project creates a "resume style" static web application (meaning it doesn't transmit data to or from it) with the Python web application framework, Flask. It then containerizes that application with Docker and stores it on Docker Hub. The container is then deployed to an Azure Web Application using Terraform.

## What this project demonstrates?
### Development
Though the application is already built and not much Python knowledge is needed to make it your own, we will still walk through the basics of how [**Flask**](https://flask.palletsprojects.com/en/3.0.x/) works and I'll be pointing you towards documentation to read. You will however have to dig through a bit of HTML to customize the website, giving you exposure to both. While web application development isn't needed for a career in IT, Python continues to prove to me to be an invaluable skill to know and I encourage anyone in IT to learn it.

### Docker
Containerization has revolutionized the modern IT environment by providing a lightweight, isolated, and consistent runtime environment for applications. It allows developers to package an application with all of its dependencies (all the extra peices and libraries needed to run an application) into a standardized unit for software development. This not only simplifies deployment but also enhances scalability and efficiency. [**Docker**](https://www.docker.com/) is the leading platform in this space, and has been instrumental in popularizing containerization. Docker is easy to use, open source, and has a huge community behind it.

In this project I'll show and explain how to create a simple Docker container for your web application and keep it in your own Docker Hub repository.

### Terraform
Infrastructure as Code (IaC) is a key practice in modern IT and cloud/hybrid environments, and [**Terraform**](https://www.terraform.io/) is one of the top tools for it. IaC allows teams to define cloud infrastructure using code rather than through a web browser or command line and through it's declarative configuration language (I'll explain more about that later) will automatically validate a cloud infrastructure's state.

## Next steps
Before we start anything, download the repository to your computer. It doesn't matter where that folder sits, but it is going to be your working project space. The non-git/simplest way to do that is to select the green **"Code"** button from the main repository page and choose **"Download Zip"**:

![image](https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/1c8cbe12-c777-4934-a0dd-4603ae394d6a)


Our first step is to set up our web application. Follow the guide for that here: [**1. Flask Guide**](https://github.com/dk-fern/flaskWebApp-with-docker/blob/main/Project%20Guide/2_Flask.md)

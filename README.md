# flaskWebApp-with-docker

Throughout my time in IT I've found that often, when being introduced to new concepts, hands on guides will use meaningless examples for testing. For example, many beginner Docker guides often just have you run a default nginx or apache web server with no functionality, or the first Azure Web Application guides bring you to an empty landing page with no use. This project hopes to change that with the ability to get hands on with some key IT technolgies in a way that brings education, experience, and a tangible product you can leave the project with.

This is a fairly beginner-friendly project designed to practice and demonstrate:
- Basic functionality in the Flask web application framework for Python
- Containerization with Docker
- Infrastructure as Code with Terraform

**When you finish this project, you will have your own custom web application that shows off your resume which is containerized in a Docker container, hosted in your own Docker Hub repository, and deployed to the cloud using Terraform.**

# Features
- The Flask application is designed to be a resume style website with multiple pages: home page, resume, and projects.
- The application is written in Python using Flask and HTML and Bootstrap (CSS framework) for formatting.
- A Terraform config will pull your Docker image from Docker Hub and run the web application in an Azure Web App-- currently this is set to the "Free F1" sku, and doesn't use custom DNS

# Usage
Navigate to the [**Project Guide**](https://github.com/dk-fern/flaskWebApp-with-docker/tree/main/Project%20Guide) folder and follow the project steps to customize this project to fit your needs.

# Preview:
<img width="1271" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/0bb47735-7585-4b71-8077-a2ace6f3ab0d">

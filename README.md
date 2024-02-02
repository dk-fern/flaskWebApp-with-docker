# flaskWebApp-with-docker
This is a project designed to practice and demonstrate:
- Basic functionality in the Flask web application framework for Python
- Containerization with Docker
- Infrastructure as Code with Terraform

# Features
- The Flask application is designed to be a resume style website with multiple pages: home page, resume, and projects
- The application is written in Python using Flask and HTML and Bootstrap (CSS framework) for formatting
- Terraform config will pull docker image from Docker Hub and run the web application in an Azure Web App-- currently this is set to the "Free F1" sku, and doesn't use custom DNS

# Usage
Follow the steps below to customize and make this project your own
### Flask Web App


### Docker


### Terraform
- Edit the HTML to your liking. The home page just explains the web app. Edit the resume and project pages to fit your own needs, and change the github link to your own github account
- Use the Dockerfile to create your own docker image and push it to your own Docker Hub account
- COMING SOON: Use the terraform configuration to upload the container to your own Azure Web App instance

# Preview:
<img width="1271" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/0bb47735-7585-4b71-8077-a2ace6f3ab0d">

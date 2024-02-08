# Step 2: Containerize Your Application

A container is a lightweight and portable software package that contains everything needed to run an application, including code, runtime, system tools, libraries, and settings. As the name would suggest, a container can be transported to any machine that has the container engine (Docker in our case), and ran without installation. Additionally, containers are isolated from the host environment so running a container inherently doesn't affect the computer it's being run on.

### Container vs Virtual Machine

One benefit of containers is that they don't need a ton of resources. As seen in the diagram below, while a VM needs a hypervisor, and its own operating system to run on top of the host OS, a container uses the host kernel/OS with a container engine to run individual container images making it more lightweight, but still isolated from the host environment.

<img width="554" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/0c0d09d2-b2bb-4158-8d13-830368ad95cf">

[image credit](https://www.netapp.com/blog/containers-vs-vms/)

### Docker

<img width="247" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/29e576d3-53ca-4183-b5c3-4b00a38786f0">


While other containerization tools exist, Docker is by far one of the most popular. It has a huge community, a lot of useful documentation, and great capabilities to do anything you may need with containers. See the [Docker website](https://www.docker.com/) for more info. For this project, we'll be using Docker to create a fairly simple Dockerfile, which is used for creating a container image, that can then be uploaded to our own Docker Hub repository.

### Let's quickly review and define some terms:
- **Virtualization**: The act of virtually replicating all aspects of a device, allowing multiple virtual instances to run simultaneously on a single physical machine, thereby maximizing resource utilization and facilitating efficient management of computing resources.
- **Container**: A software package that contains everything needed to run an application included in it.
- **Docker**: One of the most popular tools used to create containers. 
- **Container Image**: A lightweight, standalone, executable package that includes everything needed to run a piece of software, including the application code, runtime, libraries, environment variables, and dependencies. It serves as a blueprint for creating containerized applications. Container images are typically built from a Dockerfile and can be shared and distributed across different environments.
- **Dockerfile**: A text-based script that contains instructions for building a Docker image. It specifies the base image to use, the commands to run during the image build process, environment variables, and other configuration settings required to create a containerized application. Dockerfiles enable developers to automate the process of building consistent and reproducible container images, promoting best practices for containerization.
- **Docker Hub**: An online repository for Docker images. With Docker we can pull any public Docker container to use for ourselves, and we can push containers to our own repository to be used later or by others.

## Steps:

## 1. Download Docker
Navigate to [THIS LINK](https://www.docker.com/products/docker-desktop/) to download Docker Desktop

<img width="1200" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/2e203d0d-715d-40b1-a600-2846505f1119">

Proceed with installing the application, accepting defaults when prompted. This will not only give you a gui version of Docker, but allow you to use Docker from the command line.

## 2. Create a Docker Hub account
Navigate to [THIS LINK](https://hub.docker.com/) and create a Docker Hub account. This will create your own repository to store your soon-to-be-created Docker image.

<img width="942" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/a64407a0-bdda-4667-a131-803d4a03eabb">

You will also need to sign in to the Docker Desktop application using this new account.

## 3. Build your Dockerfile
Now comes the fun hands on stuff, let's build your Dockerfile. In VS Code, with your project folder open like we did before (you can navigate to *"file"* > *"Open Folder..."* if it's not already open), I want you to right-click on the ***"Dockerfile"*** file, and delete it. Why? Cause we're going to be re-building it from scratch together, and it's actually pretty simple. See that file named ***"requirements.txt"***? Delete that too!

Now let's get to building:

### requirements.txt
***"requirements.txt"*** is used by our Dockerfile to install any libraries or other dependencies the container will need. Remember when we created our web application we had to run `pip install flask` and `pip install waitress`? The ***"requirements.txt"*** file will tell our Docker container to do the same thing with any libraries defined in it. 

**How To:**
1. If it isn't already open, open your terminal in VS Code. Make sure you are in the project's root directory (the same one that ***"app.py"*** is in), and run `code requirements.txt`. This will open up a new file to work on.
2. On line one, type ***"flask"***, and on line 2 type ***"waitress"***, like so:
```
flask
waitress
```

Then just make sure you save it, and you're good to go for this file. As a note, ***"requirements.txt"*** is a standard naming convention of this file, so Docker when building the container image, will specifically look for a file name ***"requirements.txt"*** to find the names of add-ons to install.

### Dockerfile
The Dockerfile is also going to be fairly simple to create for our application. This isn't always the case, but because our application is simple, it makes the Dockerfile simple as well.

**How To:**
1. Install the Docker extension for VS Code. On the left hand side of VS Code, click on the ***"Extensions"*** icon, and type in *Docker* to find the extensions.

  <img width="313" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/fdbb57b7-0dfe-48af-8a60-54879c6e9d78">

  You may need to close and re-open the program. This extension can help us with formatting and give helpful tools and tips for creating Docker images.

3. In the terminal run `code Dockerfile` (note the capital "D" in Docker and that the file doesn't have an extension). We are going to write 6 lines of code that will build our Docker image:

```docker
FROM python:3-alpine3.18

WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

EXPOSE 8080

CMD ["python", "./app.py"]
```

Now don't just copy and paste this, but write it out line by line for the experience and getting more comfortable.

### **Line 1**: On the first line of your Dockerfile we're going to write:

```docker
FROM python:3-alpine3.18
```

**BREAKDOWN:**

What we're essentially saying to Docker when it builds the image is: *"Use this base Alpine Linux image with Python already pre-installed, and we're gonna build the rest of our container on top of it"*. This allows us to simplify things and not have to manually install Python into our container. Python has a [Docker Hub repo](https://hub.docker.com/_/python) with a good amount of pre-configured images that you can use for projects. As a suggestion, I would use as recent of a Docker image as you can for the sake of security and longevity (note: in my own version I notice there is a more recent Alpine version than 3.18, I will update that in my personal docker image). You may notice that when you type, because of the VS Code Docker extension, suggestions pop-up for what container images are available to use, if you don't see that you can start typing `FROM python:3` then hit `ctrl + space` and the suggestions should appear for you.

![image](https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/79aa9eca-cf9f-4379-8308-4566c9044995)

### **Lines 2-3**

I personally like to skip lines in the file for neat-ness. Either way, the second and third lines of our Dockerfile are going to look like this:

```docker
WORKDIR /app

COPY . /app
```

**BREAKDOWN:**

Previously in line 1 we defined our base Docker image. Now we are defining which folder we want the application to be moved to. `WORKDIR /app` tells Docker: *"When you build the Docker image, use **"/app"** as the folder to do everything from."*

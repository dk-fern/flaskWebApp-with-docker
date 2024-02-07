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
Now comes the fun hands on stuff, let's build your Dockerfile. In VS Code, with your project open like we did before, I want you to right-click on the ***"Dockerfile"*** file, and delete it. Why? Cause we're going to be re-building it from scratch together, and it's actually pretty simple. See that file named ***"requirements.txt"***? Delete that too!

Now let's get to building:

### requirements.txt
***requirements.txt*** is used by our Dockerfile to install any libraries or other dependencies the container will need. Remember when we created our web application we had to run `pip install flask` and `pip install waitress`?



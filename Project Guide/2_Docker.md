# Step 2: Containerize Your Application

A container is a lightweight and portable software package that contains everything needed to run an application, including code, runtime, system tools, libraries, and settings. As the name would suggest, a container can be transported to any machine that has the container engine (Docker in our case), and ran without installation. Additionally, containers are isolated from the host environment so running a container inherently doesn't affect the computer it's being run on. In the modern IT environment, containers are widely used in cyber infrastructure and having understanding and hands-on experience with them is hugely beneficial.

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

**Let's get started!**

## Steps:

## 1. Download Docker
Navigate to [THIS LINK](https://www.docker.com/products/docker-desktop/) to download Docker Desktop

<img width="1200" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/2e203d0d-715d-40b1-a600-2846505f1119">

Proceed with installing the application, accepting defaults when prompted. This will not only give you a gui version of Docker, but allow you to use Docker from the command line.

Now let's open the application, this will ensure that the Docker engine starts and will be running when we want to use it. If you ever encounter an error mentioning the Docker service/daemon isn't running, you can simply open Docker Desktop and it will start.

## 2. Create a Docker Hub account
Navigate to [THIS LINK](https://hub.docker.com/) and create a Docker Hub account. This will create your own repository to store your soon-to-be-created Docker image.

<img width="942" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/a64407a0-bdda-4667-a131-803d4a03eabb">

You will also need to sign in to the Docker Desktop application using this new account.

## 3. Build your Dockerfile
Now comes the fun hands on stuff, let's build your Dockerfile. In VS Code, with your project folder open like we did before (you can navigate to *"file"* > *"Open Folder..."* if it's not already open), I want you to right-click on the ***"Dockerfile"*** file, and delete it. Why? Cause we're going to be re-building it from scratch together, and it's actually pretty simple. See the files named ***".dockerignore"*** and ***"requirements.txt"***? Delete those too!

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

### .dockerignore
The .dockerignore file is used to tell Docker, *"Do not include these things in the Docker image"*. This can be done for a number of reasons, but in our case, we don't want anything related to git, terraform, or these project instructions in our image, as they have no use for the container. In your terminal run `code .dockerignore` (note the dot "." at the beginning of the filename), copy and paste the contents below:

```
__pycache__
flaskWebAppTerraform
Project Guide
```

Then hit save and you're good to go!

### Dockerfile
The Dockerfile is also going to be fairly simple to create for our application. This isn't always the case, but because our application is simple, it makes the Dockerfile simple as well.

**How To:**
1. Install the Docker extension for VS Code. On the left hand side of VS Code, click on the ***"Extensions"*** icon, and type in *Docker* to find the extensions.

  <img width="313" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/fdbb57b7-0dfe-48af-8a60-54879c6e9d78">

  You may need to close and re-open the program. This extension can help us with formatting and give helpful tools and tips for creating Docker images.

2. In the terminal run `code Dockerfile` (note the capital "D" in Docker and that the file doesn't have an extension). We are going to write 6 lines of code that will build our Docker image:

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
  
  Previously in line 1 we defined our base Docker image. Now we are defining which folder we want the application to be moved to. `WORKDIR /app` tells Docker: *"When you build the Docker image, use **"/app"** as the folder to do everything from"*. `COPY . /app` is telling Docker to copy all contents from this folder (The **"."** means the folder you are currently in) into our newly created **"/app"** folder in our container. Remember, the contents of anything in ***".dockerignore"*** won't be included in our container.

### **Line 4**
Again, skip a line and write:

```docker
RUN pip install -r requirements.txt
```

  **BREAKDOWN:**

  This is telling Docker: *"Run the command `pip install -r requirements.txt`"*. If you think back to the work we've done already, when we install Python libraries, we use `pip <library name>` to do so, and we created ***"requirements.txt"*** to define the libraries we are going to install. This ensures that our container has the required libraries installed for our web app.

### **Line 5**
Skip another line and write:

```docker
EXPOSE 8080
```

  **BREAKDOWN**

  Remember previously when we built our Flask application we used a web server to allow web traffic over port 8080? We now need to tell our container to allow traffic to that same port, this is what this line is doing.

### **Line 6**
Last line, skip another line and write:

```docker
CMD ["python", "./app.py"]
```

  **BREAKDOWN**

  This is going to be the command that runs our web application. It's a little different than when we used ***"RUN"*** in line 4, because that was used in the container's build process. In this case, ***"CMD"*** is going to define what command should be ran when the container is started.

**That should be it!** We have our Dockerfile and all our pieces in place, let's build our Docker image.


# Building the Docker Image
Although we have Docker Desktop (the gui application) installed, we're primarily going to be working in the command line for this. I like doing this because although Docker Desktop is really convenient when running multiple Docker images, and the whole Docker experience easy, I feel like using the command line helps you understand what's actually going on more than the gui version.


## Steps:
Like always, make sure we have our project folder and terminal windows open, and ensure that in the terminal you are in the same directory as the Dockerfile. 

### 1. Build the image

***Validate everything works:*** Run the command `docker --version` and make sure you don't get any sort of error message. You sould see the version of Docker you are working with.

Run the command:
```docker
docker build -t <image_name> .
```

- `docker build` tells Docker to build an image based on a Dockerfile.
- `-t <image_name>` assigns a tag to the image. To format your image name, type `<your username>/<name of image>:<tag/version>`
  - For example, if you view my output below, my full command would be: `docker build -t dkfern/flask-web-app:0.0.1 .`
  - As a tip (which I didn't do, but have since changed my docker image tag to be), a good convention is for your tag to be *'latest'*
- `.` The dot (***"."***) tells docker to look in the current directory for the Dockerfile.

This will create our docker image. Make sure it worked by running: `docker image ls`. You should get an output that looks similar to this:
```
REPOSITORY             TAG       IMAGE ID       CREATED       SIZE
dkfern/flask-web-app   0.0.1     830ddb928cd5   2 weeks ago   67MB
```
*REMEMBER: If you get some sort of error related to the service/daemon not running, open Docker Desktop and it will start.*

You should get an output in your terminal after running the `docker build` command that looks something like this:

<img width="848" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/eb61d478-e125-42d2-ad9b-dc15beec5b7a">


### 2. Run the container 
Now let's run our Docker image to give it a test!

> [!NOTE]
> A note about image names**
> - Docker images consist of both a name and in most cases a tag, separated by a colon. Tags are often used for version control.
> - If you look above at my sample output, the full name of my image would be ***dkfern/flask-web-app:0.0.1***
> - A naming convention is frequently using the tag ":latest", when a tag is not defined on an image, the tag ":latest" will be automatically applied.

**To run the Docker image we'll use this command:**
  ```docker
  docker run -d -p 8080:8080 <image_name>
  ```

<img width="763" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/2635daee-aabe-4101-a308-ad7117570b6a">

The output should look like a hash value, this is a unique value assigned to your image by Docker.

Some things to note in this command:
- Use your image name and tag rather than `<image_name>`. So in my case, the image name would be: ***"dkfern/flask-web-app:0.0.1"***
- `docker run` is telling docker to run a Docker image as a container
- `-d` is uses to run in *"detatched"* mode, meaning you can have continued use of your terminal. Not using "-d" wouldn't allow you to continue typing comands and you would have to press ***"ctrl+c"*** to exit
- `-p 8080:8080` The "-p" flag specifies ports followed by the ports to direct to/from. The port number left of the colon specifies the host port, meaning which port your computer will use to connect to the container. The port number left of the colon specifies the container port, meaning which port the container will use to connect to your computer. These numbers don't have to be the same, but remember that in our web application we exposed **port 8080**. This means that our container port (the one on the right) does have to be 8080. When we go to access our web application in one second, the port number we specify as our host port (the left one) will have to be defined in our web browser.

That should be it! Open your web browser and navigate to `localhost:8080` and you should see your running web application.

### View your running containers:
Run the command `docker ps`. This will show you all containers you have running (which should currently just be one container). 

<img width="897" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/ec515a41-c950-4238-817e-00491b000a86">

### Stop the container:
Now let's stop the container from running, cause if we don't need a container to run, we should't have it run. See the value under ***CONATINER ID*** in the above image. That's the value I need to stop the container. 

Run the command `docker stop <container id>`. Note, if you only have one container running, you only need to type in the first few characters in the CONTAINER ID value as shown below:

<img width="530" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/51395b90-ef36-4239-88a4-d9e6302f1ef8">

Now run `docker ps` again to confirm nothing is running.


### Congratulations!
You just ran your first container image! Now let's push it to Docker Hub.

# Push to Docker Hub
Now that we have our container image and we know that it works, let's push it to our Docker Hub repository. Make sure you are signed in through Docker Desktop (signing in can be done in the terminal as well but we already did it before in the gui).

Now run the command `docker push <full docker name and tag>`

As shown below, make sure your full docker name and tag includes your username, container name, and tag like we set before when creating the container.

<img width="672" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/d8eccffd-5b19-4eeb-a572-105393d81551">

*note: I had previously pushed this container to Docker Hub so your output may look slightly different than mine*

### Check online
Now if you take a look online at Docker Hub, you should see your newly pushed container:

<img width="941" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/03402dbe-d369-4c13-a93e-7f26ae5def24">


# Section Conclusion:
Let's take a look back at what we did in this section:
- **Learned about containerization and Docker**: We got some background on what containers are used for and why they are used in a modern IT environment, learned a bit about Docker, and learned some important terms.
- **Set up our dependencies**: installed Docker and created a Docker Hub account that will host our Docker image to be used in the next section.
- **Got hands on**: We created *requirements.txt*, *.dockerignore*, and our *Dockerfile* that will acted as a blueprint to our container image.
- **Ran the commands**: From the terminal we explored some basic Docker commands, created our Docker image, ran it to test locally, and finally pushed it to our Docker Hub repository.

Pat yourself on the back! You now have some hands on experience with containers and Docker!

In our next section: [3_Terraform.md](https://github.com/dk-fern/flaskWebApp-with-docker/blob/main/Project%20Guide/3_Terraform.md) we'll be taking a look at another key concept: Infrastructure as Code using Terraform.







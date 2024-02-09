# Step 1: Create your Flask application

First we are going to create our web application. To be perfectly honest, this is going to be the longest and most complex part of the project. And to be perfectly honest again, as an IT professional the Docker and Terraform parts of this project are actually more substantial and important to your career, but in this step we have the opportunity to be creative and have a little fun. Let's jump into it!

[Official Flask Documentation](https://flask.palletsprojects.com/en/3.0.x/)

## Structure Explanation:
In our home [**repository page**](https://github.com/dk-fern/flaskWebApp-with-docker) we will find the files for our web application:
- [**The Website Directory**](https://github.com/dk-fern/flaskWebApp-with-docker/tree/main/Website) -- This holds the contents to our web application including all the HTML, Python code, and images used.
- **app.py** -- This is the code that launches the application. Naming this code 'app.py' is a common convention used in Flask

<img width="761" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/78923723-80fb-491d-ad26-1fd592681c55">


# Steps
## 1. Download dependencies
**We're going to first download everything we need to run and edit our application:**

### Download Python
Download and install [Python](https://www.python.org/downloads/) if not already installed on your device. As you install, just accept the defaults and you should be good to go.

<img width="889" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/d576607b-5e47-476a-adbe-8478cc96f399">


### Download your IDE (code editor)
- Download and install [**VS Code**](https://code.visualstudio.com/download) -- Visual Studio Code (VS Code) is a commonly used tool created by Microsoft for writing code that includes options for features that make writing code convenient (e.g. the use of extensions, a built in terminal window, etc.)

<img width="906" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/f7bb9197-17a1-4857-a737-194452f0cd7f">

- *Optional but encouraged* - Download a few extensions for vs code:
   - With VS Code open, select the "Extensions" button on the left: ![image](https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/2b4d49b1-fd74-440c-a8ac-6cfb458054ef)
   - I'll suggest more extensions to download in the next two docs, but for now I prefer using: "Python" and "Prettier - Code formatter" as they both make coding in Python and HTML a little more convenient
  
### Download necessary Python libraries
Python libraries are pre-built code that you can use to enhance your own code. This can be helpful because to builda complex application, you won't have to write every single bit of code yourself. To run our web app, we'll need to download two python libraries, Flask and Waitress (the web server used to run the application). In the upper nav bar in VS Code, select ***"Terminal"** > ***"New Terminal"***. This will open a terminal in the lower half of your screen that can be adjusted up or down.

- **Run the following commands in your terminal:**
  - ```pip install Flask```
  - ```pip install waitress```
- *Note: Note these are case sensitive. Users working on Mac may need to run: python3 pip install ____*

- ***Explanation of commands:***
  - "pip" is the package manager used by python
  - The commands you ran are installing both the Flask and waitress python libraries, both of which are needed to run the web app

## 2. Test the application
Let's quickly run the web app as it is just to get a feel of what's going on.

You can navigate to the project folder in your terminal, or an easier way can be to open the project folder directly. In the icons on the left, select "Explorer" (the top one) and choose "Open Folder". Then choose your project folder. This will open a new window with your project loaded and ready to go. You should notice in your terminal that your path is already set to your project folder.

![image](https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/bd3caee9-4f53-4550-9430-8471b8986435)

### Run the application
In your terminal (Navigate to: "Terminal" > "New Terminal" if it's not already open) type the command ```python app.py```. If you've never worked with python before, then congrats! You just ran your first python application. 

Open a web browser and navigate to ***"localhost:8080"***. You should see this:

![image](https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/1231d769-bef7-4a84-93be-e0b0a05bdb08)

Take a look around to see what you are going to be adjusting to make your own. When you are done navigating, go back to your terminal and press ctrl + c to stop the application.

### Let's look at the code
Still in your terminal, type ```code app.py``` (***code <file name>*** is the vs code command to edit whichever code you want to work on). This is what you should see:

```python
from Website import create_app

if __name__ == "__main__":
    app = create_app()
    from waitress import serve
    serve(app, host="0.0.0.0", port=8080)
    #app.run(debug=False)
```
I won't explain every line of code in this web app, but I will explain this file fully just to get a little comfortable and because this file is structurally important to the web application:
1. `from Website import create_app`: Here we are pulling from within our "Website" directory a function in `__init__.py` called create_app. This create_app function will connect the peices of the way our web app looks and the way it structurally functions.
2. `if __name__ == "__main__":` This is a Python convention that ensures the code is only executed if the script is run directly (tbh don't worry too much about this at this level)
3. `app = create_app()`: Here we take that function we imported in line one and turn it into an object
4. `from waitress import serve`: We import that "waitress" library we installed earlier. This will handle our web server
5. `serve(app, host="0.0.0.0", port=8080)`: This is the most important for us to understand right now. This using a module from the "waitress" library to start a web server, run our app, allow incoming traffic from any IP address (*host="0.0.0.0*) and open port 8080 to receive web traffic.
6. `#app.run(debug=False)`: This is commented out code (meaning it's not actually being ran by the application). Debug mode is used in developing the application for testing and figuring out errors in your code.

### Let's take a breath
This may have felt like a lot of information (because it was, especially if you're not super familiar with Python) but let's take a look at what we've accomplished so far:
1. Installed a dove into VS Code- an awesome program used by top level programmers that has very few limitations to what you can do
2. Installed python libraries
3. Ran our web application and saw that it worked
4. Began understanding the Python code in our Flask application.

Okay are you ready? Now let's jump into the rest of the application including adjusting the HTML!

## 2. How Flask Works:
Open up the [***Website***](https://github.com/dk-fern/flaskWebApp-with-docker/tree/main/Website) directory. Here is the rest of our Web app. You should find two folders and two files, we'll dive into each of them now:
1. `static`: This folder holds our images. Flask will look for a directory named "static" to hold files like this. They are directly referenced within our HTML in a certain way that Flask will know to look back in this "static" folder to find the image we want.
2. `templates`: This folder holds our HTML. We will soon be editing this in our next section for you to personalize this web app to make it your own
3. `__init__.py`: This is the file that was referenced in our `app.py` file. Simply put, it's putting all the peices together for us in our web app
4. `views.py`: Open this one up with `code views.py`, this is what you'll see:
```python
from flask import Blueprint, render_template

views = Blueprint("views", __name__)

@views.route("/")
@views.route("/home")
def home():
    return render_template("home.html")

@views.route("/projects")
def projects():
    return render_template("projects.html")

@views.route("/resume")
def resume():
    return render_template("resume.html")
```
Each of these ***@views.route*** lines is going to define a different page in our web app. So if we navigate to our base url with just a ***"/"*** or a ***"/home"***, flask is going to load up the HTML in our ***home.html*** file. Likewise, if we go to ***"https://`<base url>`/projects"***, Flask will load our ***projects.html*** file. For now we'll leave them as is, but they can be added, removed, or adjusted as needed; we will just have to make other changes in lines 32-34 in ***"base.html"*** to match.

### Web app structure:
Take a look at the `templates` folder, this is what is actually housing the HTML that our web app uses. You can open them using `code *file_name.py*` or by just selecting it in your open folder:

<img width="328" alt="image" src="https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/bbdebcf1-e4c2-4211-9750-e73b62ab43b7">

We'll jump into what to actually edit in just a minute, but for now let's open up `base.html`. Flask does a cool thing where you can create a base file like this one as a template to build the web app off of (for example the upper navigation bar is in base.html so the code for that doesn't have to be inserted into every page), and insert *"blocks"* to adjust by each page. This means that our web app will be able to look consistent with less code. With `base.html` open, take a look at line 7 and line 41. Both of them have something that looks like:
```html
<title>{% block title %}{% endblock %}</title>
```
Fully understanding HTML is outside the scope of this project, but as a quick lesson, all HTML sits inside of tags like:
- `<title>`: being the opening tag of a title
- `</title>`: being the closing tag of a title.
- The content of what we want the title page to be would sit in-between these tags.
- As you can see throughout the rest of the project, there are a lot of other kind of tags that do different things (e.g. `<div>`, `<body>`, and lots more)
All tags need an opening and closing. The `{% block title %}{% endblock %}` part is a special part of Flask that is a way to insert other data from our other HTML files into this template.

To prove this, let's open up `projects.html`. Notice on line 2 we have "Projects" sitting between the blocks mentioned earlier:
`{% block title %}Projects{% endblock %}`

Additionally, on line 3 and line 42, we have `{% block content %}` and `{% endblock %}` respectively, with all the HTML for that page sitting between them. This is the way that we are inserting this HTML into our pre-existing template created in `base.html`.

### One thing you can change in base.html:
`base.html` holds the information that creates the navigation bar at the top of the page. Look at lines 31-36:
```html
 <div class="navbar-nav">
     <a class="nav-item nav-link" href="/home">Home</a>
     <a class="nav-item nav-link" href="/resume">Resume</a>
     <a class="nav-item nav-link" href="/projects">Projects</a>
     <a class="nav-item nav-link" href="https://github.com/dk-fern" target="_blank">GitHub</a
 </div>
```
Let's keep "Home", "Resume", and "Projects" the same (feel free to do whatever you want though if you're feeling ambitious). I would recommend though removing my github link and adding your own github.

## 3. Making It Your Own
Now we get to the fun part of being able to edit and adjust the HTML to be your own. On this web application we have 3 pages and a github link (as discussed in the last section, change the url for that to your own github account). Normally when editing the Flask application we would put it into "debug" mode to allow us to view changes along the way. For the sake of simplicity and not having to change too much within the Python part of the application we won't do that, so when you make changes to the HTML and want to view it in the web browser you will have to save the file, stop the application (remember, to do this hit `ctrl + c` while in the terminal), then restart the application (another reminder, use `python app.py` to run the application)

NOTE: If you start getting lost in the HTML or want to add some of your own functionality that isn't currently being utilized, I would highly suggest using a tool like ChatGPT or Edge's Copilot funtionality (which is just ChatGPT). While these tools aren't always the best at adding complext functionality, putting in your HTML and asking the tool to clean it up or clarify something can be super helpful and is honestly what I did when creating this, as I had pretty limited experience with HTML or Bootstrap.

**Lets look at the next three pages and I'll suggest some ways you can change those to fit you!**

### home.html
On this page I would suggest editing the intro chunk of text between lines 18-21:
```html
<p>
     Hello, I'm Dylan, a Cybersecurity professional working, experimenting with, and deploying technology with the 
     hope of growing and displaying my knowledge and technical ability. This website is a simple web application 
     written using the Flask web framework for Python, containerized using Docker, and deployed using Terraform to the cloud. 
     The goal of creating this is to not just demonstrate technical ability, but to create a guide and make all resources available for others to do the same.
 </p>
```
*HINT: Technically in HTML, you can just keep typing a line without having to hit 'enter' on your keyboard. But for the sake of readability I put this paragraph on multiple lines of code. But the places where you put a new line in your HTML code isn't going to reflect as a line-break in the web browser.*

The idea behind this paragraph is just an intro to you! The home page as a whole outlines the project but this will be the landing page where you can tell the viewer who you are and intro the project.

### projects.html
This page is designed to showcase some relevant technical projects that you've worked on. Lines 24-35 are what we'll be editing on this page:
```html
<h5 style="margin-top: 1em;">Cybersecurity Bootcamp</h5>
    <p>A comprehensive learning path taught by industry experts. Courses ranged from Windows and Linux security, 
        Network security, Cloud security, ethical hacking, digital foresics, incident response, and more.
    </p>
<h5 style="margin-top: 1em;">TryHackMe Defensive Security Learning Path</h5>
    <p>Over 30 courses allowing hands on real world experience in a variety of topics. Courses include topics like 
        Splunk, Wireshark, malware analysis tools, various incident response and forensics tools, and more.
    </p>
<h5 style="margin-top: 1em;">Security Analyst Lab</h5>
    <p>In Azure, created and configured an intentionally vulnerable machine allowing ICMP traffic from the open internet. 
        Pushed machine logs to Microsoft Sentinel and created a map displaying log-in attempts around the world.
    </p>
```
Each chunk lists the project name within the `<h5 style="margin-top: 1em;">Cybersecurity Bootcamp</h5>` section (in this case the project is ***"Cybersecurity Bootcamp"***) and the project description falls underneath between the two `<p> </p>` tags. Because each project's HTML is the same, it can easily be duplicated and adjusted to add as many projects as necessary.

### resume.html
Finally, our resume page is to showcase your job experience. The HTML on this page is a little less repeatable, but I would suggest running the web application and looking at the code side-by-side to get a good view of what each section does. At a high level, like a regular resume, we have a few different headers: **"About Me"** (line 14), **"Skills"** (line 27), and **"Job Experience"** (line 41). 
- In the **"About Me"** section, adjust the paragraph between the `<p> </p>` tags to fit yourself
- In the **"Skills"** section, lines 29-34 are broken down into further subsections: "Operating Systems, Programming Languages, and Technologies", "Other Technical Skills", and "Soft Skills" with the actual skills falling between the the `<p> </p>` tags. Adjust anything to your liking
```html
<h5 style="margin-top: 1em;">Operating Systems, Programming Languages, and Technologies</h5>
    <p>Windows, Linux, Python, Azure, Terraform, Splunk, Microsoft Defender, Active Directory</p>
<h5 style="margin-top: 1em;">Other Technical Skills</h5>
    <p>Networking, packet analysis, log analysis</p>
<h5 style="margin-top: 1em;">Soft Skills</h5>
    <p>Leadership, learning, communication, training, empathy</p>
```

- In the **"Job Experience"** section, lines 43-64 are also broken down into subsections.
```html
<h5 style="margin-top: 1em;">Cybersecurity Operations Analyst</h5>
<p style="font-weight: bold;">Bringing greater technical ability to an analyst role through automation with Python, configuring IAM solutions, and vulnerability management</p>
  <ul>
      <li>Responsible for triaging and coordinating cybersecurity incident detection, response, and remediation 
          following best practices and frameworks such as the Incident Response Lifecycle. </li>
      <li>Engineer and configure Identity and Access Management (IAM) solutions like Single-Sign On (SSO) and Just in Time access. 
          This has helped the enterprise not only adhere more closely to the principle of Least Privileged, but allowed us to implement conditional access policies
          more broadly.</li>
      <li>Write wide variety custom Python scripts. These have ranged from simple data parsing to production level integrations interacting with Restful APIs, SQL databases,
          and other technologies.</li>
      <li>Developed processes and procedures to not just streamline the enterprise's cybersecurity landscape, but also to give others a more simplified entry point into cybersecurity
          in the aim of seeing their own careers grow. I work to take a posture of servant leadership with those wanting to further their careers in security.</li>
      <!-- Add more items as needed -->
  </ul>
```
  
   - The Job title is between the `<h5> </h5>` tags, the description is the line below that betwen the `<p> </p>` tags, and the responsibilities are each listed in `<li> </li>` tags.
   - *HINT: Keep each listed item on it's own row like I have it in this code to make it easy to organize

If you're feeling overwhelmed with the HTML or getting lost, remember to utilize ChatGPT or a similar AI tool. Putting in your HTML and asking it to clean up your code for you or explain certain lines can be super helpful.

## 4. Final Step: Re-run Your Web Application

With everything saved, let's re-run the web app and see our finished product. I'm sure you did this multiple times throughout testing and development, but in your terminal (make sure your terminal path is back in the same directory as `app.py`) run the command `python app.py`. Open up your web browser, navigate to ***"localhost:8080"*** and take a look.

I'm crossing my fingers for you that everything works and looks good, and congratulations! You've successfully created your first web application and I'm sure it looks great!

## Next steps: 
Like I said at the beginning: as an IT professional, developing a web application isn't generally a necessary part of the job. But this step was necessary in our project to get to using Docker and Terraform to deploy the application. While you could have done the same thing with a sample web app that just showed a generic website with no functionality, you instead took the chance to learn something new and actually interesting/useful. Having your own resume website is great to show off to employers and really stands out! 

Now let's move to our next step, getting hands-on with Docker. Click here to move to the [Docker Guide](https://github.com/dk-fern/flaskWebApp-with-docker/blob/main/Project%20Guide/2_Docker.md)



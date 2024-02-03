# Step 1: Create your Flask application

First we are going to create our web application. 

## Structure Explanation:
In our home [**repository page**](https://github.com/dk-fern/flaskWebApp-with-docker) the files for the web app are:
- [**The Website Directory**](https://github.com/dk-fern/flaskWebApp-with-docker/tree/main/Website) -- This holds the contents to our web application including all the HTML, Python code, and images used.
- **app.py** -- This is the code that launches the application. Naming this code 'app.py' is a common convention used in Flask

# Steps
## 1. Download dependencies
**We're going to first download everything we need to run and edit our application:**
### Download your IDE (code editor)
- Download and install [**VS Code**](https://code.visualstudio.com/download) -- Visual Studio Code (VS Code) is a commonly used tool created by Microsoft for writing code that includes options for features that make writing code convenient (e.g. the use of extensions, a built in terminal window, etc.)
- *Optional but encouraged* - Download a few extensions for vs code:
   - With VS Code open, select the "Extensions" button on the left: ![image](https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/2b4d49b1-fd74-440c-a8ac-6cfb458054ef)
   - I'll suggest more extensions to download in the next two docs, but for now I prefer using: "Python" and "Prettier - Code formatter" as they both make coding in Python and HTML a little more convenient
  
### Download necessary Python libraries
To run the web app, we'll need to download two python libraries, Flask and Waitress (the web server used to run the application). In the upper nav bar in VS Code, select ***"Terminal"** > ***"New Terminal"***. This will open a terminal in the lower half of your screen that can be adjusted up or down.
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
In your terminal ("Terminal" > "New Terminal") type the command ```python app.py```. If you've never worked with python before, then congrats! You just ran your first python application. 

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
Each of these ***@views.route*** lines is going to define a different page in our web app. So if we navigate to our base url with just a ***"/"*** or a ***"/home"***, flask is going to load up the HTML in our ***home.html*** file. Likewise, if we go to ***"https://<base url>/projects"***, Flask will load our ***projects.html*** file. For now we'll leave them as is, but they can be added, removed, or adjusted as needed; we will just have to make other changes in ***"base.html"*** to match.






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
  - *pip install Flask*
  - *pip install waitress*
- *Note: Note these are case sensitive. Users working on Mac may need to run: python3 pip install ____*

***Explanation of commands:***
- "pip" is the package manager used by python
- The commands you ran are installing both the Flask and waitress python libraries, both of which are needed to run the web app

## 2. 

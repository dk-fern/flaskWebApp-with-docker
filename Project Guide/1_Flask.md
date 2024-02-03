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

- ***Explanation of commands:***
  - "pip" is the package manager used by python
  - The commands you ran are installing both the Flask and waitress python libraries, both of which are needed to run the web app

## 2. Test the application
Let's quickly run the web app as it is just to get a feel of what's going on.

You can navigate to the project folder in your terminal, or an easier way can be to open the project folder directly. In the icons on the left, select "Explorer" (the top one) and choose "Open Folder". Then choose your project folder. This will open a new window with your project loaded and ready to go.
![image](https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/bd3caee9-4f53-4550-9430-8471b8986435)

### Run the application
In your terminal ("Terminal" > "New Terminal") type the command ***"python app.py"***. If you've never worked with python before, then congrats! You just ran your first python application. 

Open a web browser and navigate to ***"localhost:8080"***. You should see this:
![image](https://github.com/dk-fern/flaskWebApp-with-docker/assets/110493897/1231d769-bef7-4a84-93be-e0b0a05bdb08)

If the page loads, then congrats again! You just ran (maybe your first) web application! Take a look around to see what you are going to be adjusting to make your own. When you are done navigating, go back to your terminal and press ctrl + c to stop the application.

### Let's look at the code
Still in your terminal, type ***"code app.py"*** (***code <file name>*** is the vs code command to edit whichever code you want to work on). This is what you should see:

```python
from Website import create_app

if __name__ == "__main__":
    app = create_app()
    from waitress import serve
    serve(app, host="0.0.0.0", port=8080)
    #app.run(debug=False)
```
I won't explain every line of code in this web app, but I will explain this one just to get a little comfortable and because this file is structurally important to the web application:
1. ***from Website import create_app***: Here we are pulling from within our "Website" directory a function in __init__.py called create_app. This create_app function will connect the peices of the way our web app looks and the way it structurally functions.
2. ***if __name__ == "__main__":*** This is a Python convention that ensures the code is only executed if the script is run directly (tbh don't worry too much about this at this level)
3. ***app = create_app()***: Here we take that function we imported in line one and turn it into an object
4. ***from waitress import serve***: We import that "waitress" library we installed earlier. This will handle our web server
5. ***serve(app, host="0.0.0.0", port=8080)***: This is the most important for us to understand right now. This using a module from the "waitress" library to start a web server, run our app, allow incoming traffic from any IP address (*host="0.0.0.0*) and open port 8080 to receive web traffic.

### Let's take a breath
This may have felt like a lot of information (because it was, especially if you're not super familiar with Python) but let's take a look at what we've accomplished so far:
1. Installed a dove into VS Code- an awesome program used by top level programmers that has very few limitations to what you can do
2. Installed python libraries
3. Ran our web application and saw that it worked





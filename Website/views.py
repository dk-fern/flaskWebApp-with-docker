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
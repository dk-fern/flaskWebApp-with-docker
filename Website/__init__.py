from flask import Flask, url_for
from os import path

# from flask_login import LoginManager

def create_app():
    app = Flask(__name__)
    app.config['ENV'] = 'production'

    from .views import views

    app.register_blueprint(views, url_prefix="/")

    return app

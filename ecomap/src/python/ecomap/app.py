import logging
import os
from datetime import timedelta

from flask import Flask
from flask.ext.triangle import Triangle

from ecomap.utils import get_logger

template_folder = os.path.join(os.environ['PRODROOT'], 'www/templates/')
app = Flask(__name__, template_folder=template_folder)
Triangle(app)

get_logger()
logger = logging.getLogger('flask_app')
logger.info('test %s', template_folder)
app.config['SECRET_KEY'] = 'a7c268ab01141868811c070274413ea3c588733241659fcb'
app.config["REMEMBER_COOKIE_DURATION"] = timedelta(days=14)     # user time lib
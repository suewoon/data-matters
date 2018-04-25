import os
import sys
import uuid

path = '/home/ubuntu/datamatters'
if path not in sys.path:
    sys.path.append(path)

os.environ['FLASK_CONFIG'] = 'production'
os.environ['SECRET_KEY'] = uuid.uuid4().hex
os.environ['SQLALCHEMY_DATABASE_URI'] = 'postgres://[username]:[password]@[host]/[db-name]'

from run import app as application
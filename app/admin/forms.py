from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from wtforms.validators import DataRequired

class DepartmentForm(FlaskForm):
    """
    Form for user with right privileges to add or edit

    """
    name = StringField
#!/usr/bin/env bash
export FOLDER=/home/flask/dashboard
cd $FOLDER
sudo python3 -m pip install virtualenv
sudo virtualenv -p python3 venv
source venv/bin/activate
sudo chown -R ec2-user:ec2-user venv
pip3 freeze > requirements.txt
pip3 install -r requirements.txt
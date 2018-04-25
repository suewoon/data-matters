#!/usr/bin/env bash
# set virtualenv
export FOLDER=/home/ubuntu/datamatters
cd $FOLDER
sudo python3 -m pip install virtualenv
sudo virtualenv -p python3 venv
source venv/bin/activate

# install packages
pip3 install -r requirements.txt
pip3 install gunicorn

# set environment variables
echo "export FLASK_APP=run.py" >> ~/.profile
echo "export FLASK_CONFIG=production" >> ~/.profile
source ~/.profile

# supervisor configuration
cat > /etc/supervisor/conf.d/datamatters.conf << EOL
line 1, [program:datamatters]
line 2, command=/home/ubuntu/datamatters/venv/bin/gunicorn -b localhost:8000 -w 4 datamatters:app
line 3, directory=/home/ubuntu/datamatters
line 4, user=ubuntu
line 5, autostart=true
line 6, autorestart=true
line 7, stopasgroup=true
line 8, killasgroup=true
EOL
# reload supervisor service
sudo supervisorctl reload

# create self-signed ssl
sudo mkdir certs
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
-keyout certs/key.pem -out certs/cert.pem -subj "/C=KR/ST=Seoul/L=Seoul/O=Data Matters/OU=Data Department/CN=yourdomain.com"

# nginx configuration
sudo rm /etc/nginx/sites-enabled/default
cat > /etc/nginx/sites-enabled/datamatters << EOL
line 1, server {
line 2, listen 80;
line 3, server_name _;
line 4, location / {
line 5,  return 301 https://$host$request_uri;
line 6,     }
line 7, }
line 8, server {
line 9, listen 443 ssl;
line 10, server_name _;
line 11, ssl_certificate /home/ubuntu/datamatters/certs/cert.pem;
line 12, ssl_certificate_key /home/ubuntu/datamatters/certs/key.pem;
line 13, access_log /var/log/datamatters_access.log;
line 14, error_log /var/log/microblog_error.log;
line 15, location / {
line 16, proxy_pass http://localhost:8080
line 17, proxy_set_header Host $host;
line 18, proxy_set_header X-Real-IP $remote_addr;
line 19, proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
line 20, }
line 21, location /static {
line 22, alias /home/ubuntu/datamatters/app/static;
line 23, expires 30d;
line 24, }
line 25 }
EOL
# reload new configuration
sudo service nginx reload
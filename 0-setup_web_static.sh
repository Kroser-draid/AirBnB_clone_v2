#!/bin/bash

sudo apt update -y
sudo apt install nginx -y
# Create required folders if it doesn't exists
mkdir -p /data/web_static/shared/
mkdir -p /data/web_static/releases/test/
echo "<html><head></head><body> Holberton School </body></html>" > /data/web_static/releases/test/index.html
ln -sf /data/web_static/releases/test/ /data/web_static/current
chown -R ubuntu:ubuntu /data/

# Find the server block and insert the configuration
sudo sed -i '39 i\ \tlocation /hbnb_static {\n\t\talias /data/web_static/current;\n\t}\n' /etc/nginx/sites-enabled/default

# Restart Nginx
sudo service $nginx_service restart


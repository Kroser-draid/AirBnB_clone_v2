#!/bin/bash

sudo apt update -y
sudo apt install nginx
# Create required folders if it doesn't exists
mkdir -p /data/
mkdir -p /data/web_static/
mkdir -p /data/web_static/releases/
mkdir -p /data/web_static/shared/
mkdir -p /data/web_static/releases/test/
echo "<html>\n<head>\n</head>\n<body> Holberton School \n</body>\n</html>\n" > /data/web_static/releases/test/index.html
ln -sf /data/web_static/releases/test/ /data/web_static/current
chown -R ubuntu:ubuntu /data/

# Define the paths
nginx_conf="/etc/nginx/nginx.conf"
nginx_service="nginx"
data_dir="/data/web_static/current"
alias_location="/hbnb_static"

# Update Nginx configuration
echo "location $alias_location {
    alias $data_dir;
}" | sudo tee -a $nginx_conf > /dev/null

# Restart nginx
sudo service $nginx_service restart

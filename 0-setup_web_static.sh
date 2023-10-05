#!/usr/bin/env bash
# preparation of web server
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt install nginx
sudo apt-get -y install nginx
web_static_dir="/data/web_static"
releases_dir="$web_static_dir/releases/test"
shared_dir="$web_static_dir/shared"
current_dir="$web_static_dir/current"
sudo mkdir -p "$web_static_dir" "$releases_dir" "$shared_dir" "$releases_dir" "$current_dir"
echo "TEST" | sudo tee "$releases_dir/index.html"
sudo ln -sf "$releases_dir" "$current_dir"
sudo chown -hR ubuntu:ubuntu /data/
sudo sed -i '38i\\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n' /etc/nginx/sites-available/default
sudo service nginx restart

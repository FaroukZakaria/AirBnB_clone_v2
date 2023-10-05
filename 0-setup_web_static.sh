#!/usr/bin/env bash
# preparation of web server
if ! command -v nginx &> /dev/null; then
	apt-get -y update
	apt-get -y install nginx
fi
web_static_dir="/data/web_static"
releases_dir="$web_static_dir/releases/test"
shared_dir="$web_static_dir/shared"
current_dir="$web_static_dir/current"
mkdir -p "$web_static_dir" "$releases_dir" "$shared_dir" "$releases_dir" "$current_dir"
echo "<html><head></head><body>Test HTML file</body></html>" > "$releases_dir/index.html"
ln -sfT "$releases_dir" "$current_dir"
chown -R ubuntu:ubuntu "$web_static_dir"
nginx_config="/etc/nginx/sites-available/default"
nginx_alias_config="location /hbnb_static { alias $current_dir/; }"
grep -qF "$nginx_alias_config" "$nginx_config" && sed -i "/$nginx_alias_config/d" "$nginx_config"
echo "$nginx_alias_config" >> "$nginx_config"
service nginx restart

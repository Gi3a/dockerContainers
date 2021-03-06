FROM	alpine:3.12

# Update
RUN		apk update
RUN		apk upgrade

# Services
RUN		apk add wget php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session supervisor \
		lighttpd php7-common php7-iconv php7-gd php7-curl php7-xml php7-imap php7-cgi nginx \
		fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix \
		php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom \
		telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache


# Move
RUN		mkdir -p /usr/share/webapps/ && cd /usr/share/webapps/ && \
		wget https://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && \
		rm -rf latest.tar.gz && chown -R lighttpd /usr/share/webapps/ && \
		ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress
COPY	/srcs/telegraf.conf		/etc/telegraf/
COPY	/srcs/wp-config.php		/usr/share/webapps/wordpress/
COPY	/srcs/supervisord.conf	/etc/supervisord.conf
RUN		rm /etc/nginx/conf.d/default.conf
COPY	/srcs/nginx.conf		/etc/nginx/conf.d/default.conf
COPY	/srcs/start.sh			.
RUN chmod +x start.sh

# Start nginx php
RUN		mkdir -p /run/nginx
RUN		mkdir -p /var/run/php

# Ports
EXPOSE	5050

ENTRYPOINT	sh start.sh
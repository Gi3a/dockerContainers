FROM	alpine:3.12

# Update
RUN		apk update
RUN		apk upgrade

# Services
RUN		apk add nginx openssl openssh supervisor
RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# User
RUN		echo "root:1234" | chpasswd

# Start
RUN		mkdir -p /run/nginx

# Move
COPY	/srcs/telegraf.conf		/etc/telegraf/
COPY	/srcs/nginx.conf		/etc/nginx/conf.d/default.conf
COPY	/srcs/supervisord.conf	/etc/supervisord.conf
COPY	/srcs/index.html 		/var/www
COPY	/srcs/start.sh			.
RUN		chmod +x start.sh

# SSL
RUN		openssl req -x509 -nodes -days 365 \
		-newkey rsa:2048 \
		-keyout /etc/ssl/private/nginx.key \
		-out /etc/ssl/certs/nginx.crt  -subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=cimyan/CN=localhost"

# Ports
EXPOSE	80 443 22

CMD		sh start.sh
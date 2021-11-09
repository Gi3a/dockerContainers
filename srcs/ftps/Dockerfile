FROM	alpine:3.12

# Update
RUN		apk update
RUN		apk upgrade

# Services
RUN		apk add vsftpd openssl supervisor
RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# User
RUN		echo "root:1234" | chpasswd

# SSL
RUN		openssl req -x509 -nodes -days 365 \
		-newkey rsa:2048 -subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=cimyan/CN=localhost" \
		-keyout /etc/ssl/private/vsftpd.key \
		-out /etc/ssl/certs/vsftpd.crt
# Move
COPY	/srcs/supervisord.conf /etc/supervisord.conf
COPY	/srcs/telegraf.conf /etc/telegraf/
COPY	/srcs/vsftpd.conf /etc/vsftpd/
COPY	/srcs/start.sh .

# Ports
EXPOSE  21 30021

ENTRYPOINT	sh start.sh
FROM	alpine:3.12

# Update
RUN		apk update
RUN		apk upgrade

# Services
RUN		apk add mariadb mariadb-client supervisor
RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# Start
RUN		mkdir -p /run/mysqld/

# Move
COPY	/srcs/supervisord.conf		/etc/supervisord.conf
COPY 	/srcs/telegraf.conf		    /etc/telegraf/
COPY	/srcs/my.cnf				/etc/
COPY	/srcs/wordpress.sql		    /
COPY	/srcs/mysql.sh				/

# Ports
EXPOSE	3306

# Reestablish
VOLUME	["var/lib/mysql"]

ENTRYPOINT	sh mysql.sh
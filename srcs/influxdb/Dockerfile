FROM	alpine:3.12

# Update
RUN		apk update
RUN		apk upgrade

# Services
RUN		echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN		apk add influxdb
RUN		apk add openrc
RUN		apk add telegraf
RUN		openrc
RUN		touch /run/openrc/softlevel

# Move
COPY	/srcs/telegraf.conf /etc/
COPY	/srcs/start.sh      /

# Reestablish
VOLUME	["/var/lib/influxdb"]

# Ports
EXPOSE	8086

ENTRYPOINT  sh start.sh
FROM	alpine:3.12

# Update
RUN		apk update
RUN		apk upgrade

# Services
RUN		echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN		apk add sudo openrc vim wget supervisor telegraf grafana
RUN		openrc
RUN		touch /run/openrc/softlevel

# Move
COPY	/srcs/supervisord.conf				/etc/supervisord.conf
COPY	/srcs/grafana.ini					/etc/
COPY	/srcs/datasources.yaml				/usr/share/grafana/conf/provisioning/datasources/influxdb.yaml
COPY	/srcs/dashboard.yaml				/usr/share/grafana/conf/provisioning/dashboards/dashboards.yaml
COPY	/srcs/telegraf.conf				    /etc/
COPY	/srcs/dashboards.json				/usr/share/grafana/public/dashboards/
COPY	/srcs/start.sh						.
RUN     chmod +x start.sh

# Ports
EXPOSE	3000


CMD     sh start.sh
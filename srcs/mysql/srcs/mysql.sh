#!/bin/sh

mariadb-install-db -u root
mysqld -u root & sleep 5

mysql -u root -e "CREATE DATABASE wordpress;"

# copy wp database
mysql -u root wordpress < wordpress.sql

mysql -u root -e "CREATE USER 'root'@'%' IDENTIFIED BY '1234';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '1234' WITH GRANT OPTION; USE wordpress;"
mysql -u root -e "FLUSH PRIVILEGES"

/usr/bin/supervisord -c /etc/supervisord.conf
#!/bin/bash

service mysql start\
&& mysql -e \
"CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;\
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';\
GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$MYSQL_USER'@'%';\
FLUSH PRIVILEGES;"\
&& sed -i 's/127\.0\.0\.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf\
&& kill $(cat /var/run/mysqld/mysqld.pid)

exec "$@"

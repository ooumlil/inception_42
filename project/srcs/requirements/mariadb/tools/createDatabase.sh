#!/bin/bash

service mysql start

sleep 2

if [ ! -d "/var/lib/mysql/$DATABASE_NAME" ]; then
	mysql -u root -e \
	"CREATE DATABASE $DATABASE_NAME;\
	CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';\
	GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$MYSQL_USER'@'%';\
	SET PASSWORD FOR 'root'@'$IP' = PASSWORD('$MYSQL_ROOT_PASSWORD');"
fi

kill $(pidof mysqld)

sleep 2

echo "mariadb has started."

exec "$@"

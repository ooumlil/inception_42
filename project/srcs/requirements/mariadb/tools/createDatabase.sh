#!/bin/bash

# Start the MySQL service
service mysql start

if [ ! -d "/var/lib/mysql/$DATABASE_NAME" ]; then
	# Creates the database, user, gives privileges on the created database to the user
	# and sets a password for the root user.
	mysql -u root -e \
	"CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;\
	CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';\
	GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$MYSQL_USER'@'%';\
	ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';\
	FLUSH PRIVILEGES;"
fi

# Modify the MySQL configuration file to bind to all interfaces
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# Stop the MySQL service
kill $(pidof mysqld)

# Start the CMD specified in the Dockerfile
exec "$@"

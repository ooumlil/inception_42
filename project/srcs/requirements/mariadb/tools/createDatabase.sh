#!/bin/bash

# Start the MySQL service
service mysql start

sleep 2

# Check if the Database doesn't exist 
if [ ! -d "/var/lib/mysql/$DATABASE_NAME" ]; then
	# Creates the database, user, gives privileges on the created database to the user
	# and sets a password for the root user.
	mysql -e \
	"CREATE DATABASE $DATABASE_NAME;\
	CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';\
	GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$MYSQL_USER'@'%';\
	SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');"
fi

# Stop the MySQL service
kill $(pidof mysqld)

sleep 2

echo "mariadb has started"

# Start the CMD specified in the Dockerfile
exec "$@"

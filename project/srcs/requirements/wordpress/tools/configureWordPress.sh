#!/bin/bash

curl -s -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar >/dev/null 2>&1

chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp

sleep 2

if [ ! -f "/var/www/html/wp-config.php" ]; then

	wp core download --path="/var/www/html"\
					--allow-root

	wp config create --dbname=$DATABASE_NAME\
					--dbuser=$MYSQL_USER\
					--dbpass=$MYSQL_PASSWORD\
					--dbhost=$DB_HOST\
					--path="/var/www/html"\
					--allow-root

	wp core install --url=$DOMAIN_NAME/\
					--title="Home Page"\
					--admin_user=$MYSQL_USER\
					--admin_password=$MYSQL_PASSWORD\
					--admin_email=$ADM_EMAIL\
					--skip-email\
					--path="/var/www/html"\
					--allow-root

	wp user create $USER $USER_EMAIL\
					--role="author"\
					--user_pass=$USER_PASS\
					--path="/var/www/html"\
					--allow-root

fi

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

if [ ! -d run/php ]; then
	mkdir run/php
fi

echo "wordpress has started."

exec "$@"

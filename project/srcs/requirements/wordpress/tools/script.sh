#!/bin/bash

# Check if wp-config.php file exists
if [ ! -f "/var/www/html/wp-config.php" ]; then

	# Download WordPress
	wp core download --path="/var/www/html"\
					--allow-root

	# Create wp-config.php file
	wp config create --dbname=$DATABASE_NAME\
					--dbuser=$MYSQL_USER\
					--dbpass=$MYSQL_PASSWORD\
					--dbhost=mariadb\
					--path="/var/www/html"\
					--allow-root

	# Install WordPress
	wp core install --url=$DOMAIN_NAME/\
					--title="Home Page"\
					--admin_user=$MYSQL_USER\
					--admin_password=$MYSQL_PASSWORD\
					--admin_email="chihajaadmin@gmail.com"\
					--skip-email\
					--path="/var/www/html"\
					--allow-root

	# Create a new user
	wp user create "eclipse" "chiahaja@gmail.com"\
					--role="author"\
					--user_pass="1234"\
					--path="/var/www/html"\
					--allow-root

	# Install and activate the Astra theme
	wp theme install "astra"\
					--activate\
					--path="/var/www/html"\
					--allow-root
fi

# Update PHP-FPM configuration to listen on port 9000
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# Create run/php directory if it doesn't exist
if [ ! -d run/php ]; then
	mkdir run/php
fi

# Start PHP-FPM
/usr/sbin/php-fpm7.3 -F

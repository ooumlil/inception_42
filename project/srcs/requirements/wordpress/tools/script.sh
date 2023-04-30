#!/bin/bash

# Install WP-CLI tool
curl -s -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar >/dev/null 2>&1

# Make it executable
chmod +x wp-cli.phar 

# move it to /usr/local/bin/wp to make it a command
mv wp-cli.phar /usr/local/bin/wp

# Check if wp-config.php file exists
if [ ! -f "/var/www/html/wp-config.php" ]; then

	# Downloads core WordPress files in the specified path using root user. 
	wp core download --path="/var/www/html"\
					--allow-root

	# Generates wp-config.php file.
	wp config create --dbname=$DATABASE_NAME\
					--dbuser=$MYSQL_USER\
					--dbpass=$MYSQL_PASSWORD\
					--dbhost=mariadb\
					--path="/var/www/html"\
					--allow-root

	# Install WordPress and Set the administrator
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
					--first_name="tkhrbi9a"\
					--last_name="tkhrbi9a_knya"\
					--path="/var/www/html"\
					--allow-root

	# Install and activate the Astra theme
	wp theme install popularfx\
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

echo "wordpress started successfully"

# Start PHP-FPM
exec "$@"

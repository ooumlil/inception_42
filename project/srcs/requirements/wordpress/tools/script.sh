#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

if [ ! -f "/var/www/html/wp-config.php" ]; then
	wp core download --path="/var/www/html"\
					--allow-root
	wp config create --dbname=$DATABASE_NAME\
					--dbuser=$MYSQL_USER\
					--dbpass=$MYSQL_PASSWORD\
					--dbhost=mariadb\
					--path="/var/www/html"\
					--allow-root
	wp core install --url=$DOMAIN_NAME/\
					--title="Home Page"\
					--admin_user=$MYSQL_USER\
					--admin_password=$MYSQL_PASSWORD\
					--admin_email="chihajaadmin@gmail.com"\
					--skip-email\
					--path="/var/www/html"\
					--allow-root
	wp user create "eclipse" "chiahaja@gmail.com"\
					--role="author"\
					--user_pass="1234"\
					--path="/var/www/html"\
					--allow-root
	wp theme install "astra"\
					--activate\
					--path="/var/www/html"\
					--allow-root
fi

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

if [ ! -d run/php ]; then
	mkdir run/php
fi

/usr/sbin/php-fpm7.3 -F

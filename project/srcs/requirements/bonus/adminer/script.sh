#!/bin/bash

apt-get update -y >/dev/null 2>&1

apt-get install -y php php-mysql wget >/dev/null 2>&1

wget "https://www.adminer.org/latest.php" -O /var/www/html/index.php >/dev/null 2>&1

echo "adminer has started."

exec "$@"

FROM debian:buster

COPY ./tools/script.sh /

# Install dependencies and WP-CLI tool
RUN apt-get -qq update >/dev/null 2>&1\
	&& apt-get -qq install -y php php-fpm curl mariadb-server php-mysql >/dev/null 2>&1\
	&& curl -s -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar >/dev/null 2>&1\
	&& chmod +x /script.sh && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp >/dev/null 2>&1

EXPOSE 9000

CMD [ "/script.sh" ]

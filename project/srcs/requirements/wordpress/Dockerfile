FROM debian:buster

COPY ./tools/script.sh /

# Install dependencies and WP-CLI tool
RUN apt-get -qq update >/dev/null 2>&1\
 && apt-get -qq install -y php php-fpm curl mariadb-server php-mysql >/dev/null 2>&1\
 && chmod +x /script.sh

EXPOSE 9000

CMD [ "/script.sh" ]

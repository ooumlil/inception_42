FROM debian:buster

COPY ./tools/configureWordPress.sh /

RUN apt-get update >/dev/null 2>&1\
 && apt-get install -y php\
 php-fpm\
 curl\
 mariadb-server\
 php-mysql\
 >/dev/null 2>&1\
 && chmod +x /configureWordPress.sh

ENTRYPOINT [ "/configureWordPress.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "-F"]

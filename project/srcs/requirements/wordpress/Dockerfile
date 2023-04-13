FROM debian:buster

COPY ./tools/script.sh /

RUN apt-get update && \
    apt install -y php php-fpm curl mariadb-server php-mysql &&\
	chmod +x /script.sh

EXPOSE 9000

CMD [ "/script.sh" ]

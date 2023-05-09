FROM debian:buster

COPY ./tools/createDatabase.sh /

RUN apt-get update -y >/dev/null 2>&1\
 && apt-get install mariadb-server -y >/dev/null 2>&1\
 && chmod +x /createDatabase.sh\
 && sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT [ "/createDatabase.sh" ]

CMD [ "mysqld" ]

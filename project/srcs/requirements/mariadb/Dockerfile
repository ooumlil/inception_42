FROM debian:buster

COPY ./tools/createDatabase.sh /

RUN apt-get -qq update -y >/dev/null 2>&1\
 && apt-get -qq install mariadb-server -y >/dev/null 2>&1\
 && rm -rf /var/lib/apt/lists/*\
 && chmod +x /createDatabase.sh

ENTRYPOINT [ "/createDatabase.sh" ]

CMD ["mysqld"]

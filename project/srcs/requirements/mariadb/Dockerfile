FROM debian:buster

COPY ./tools/createDatabase.sh /

RUN apt-get -qq update -y\
	&& apt-get -qq install mariadb-server -y\
	&& rm -rf /var/lib/apt/lists/*\
	&& chmod +x /createDatabase.sh

ENTRYPOINT [ "/createDatabase.sh" ]

CMD ["mysqld"]

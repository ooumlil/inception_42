FROM debian:buster

COPY ./tools/createDatabase.sh /

RUN apt-get update -y\
	&& apt-get install mariadb-server -y\
	&& rm -rf /var/lib/apt/lists/*\
	&& chmod +x /createDatabase.sh

ENTRYPOINT [ "/createDatabase.sh" ]

CMD ["mysqld"]

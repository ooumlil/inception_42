FROM debian:buster

# Copy the script to the container.
COPY ./tools/createDatabase.sh /

# Install dependencies
RUN apt-get update -y >/dev/null 2>&1\
 && apt-get install mariadb-server -y >/dev/null 2>&1\
 && chmod +x /createDatabase.sh

ENTRYPOINT [ "/createDatabase.sh" ]

CMD [ "mysqld" ]

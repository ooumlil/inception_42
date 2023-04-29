FROM debian:buster

# Copy the script to the appropriate location
COPY ./tools/script.sh /

# Install dependencies
RUN apt-get update >/dev/null 2>&1\
 && apt-get install -y  php\
  						php-fpm\
						curl\
						mariadb-server\
						php-mysql\
						>/dev/null 2>&1\
 && chmod +x /script.sh

EXPOSE 9000

# Execute the script
ENTRYPOINT [ "/script.sh" ]

# After its execution run php-fpm
CMD ["/usr/sbin/php-fpm7.3", "-F"]

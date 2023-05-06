FROM debian:buster

# Copy the script to the appropriate location
COPY ./tools/configureWordPress.sh /

# Install dependencies
RUN apt-get update >/dev/null 2>&1\
 && apt-get install -y php\
 php-fpm\
 curl\
 mariadb-server\
 php-mysql\
 >/dev/null 2>&1\
 && chmod +x /configureWordPress.sh

# Execute the script
ENTRYPOINT [ "/configureWordPress.sh" ]

# After its execution run php-fpm
CMD ["/usr/sbin/php-fpm7.3", "-F"]

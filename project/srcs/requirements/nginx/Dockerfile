FROM debian:buster

# Copy the script to the container
COPY ./conf/script.sh /

# Install dependencies
RUN apt-get update >/dev/null 2>&1\
 && apt-get install -y nginx openssl >/dev/null 2>&1\
 && chmod +x /script.sh

# Copy The nginx config file to the appropriate location
COPY ./conf/server.conf /etc/nginx/conf.d

# Execute the script
ENTRYPOINT [ "/script.sh" ]

# Start nginx Server in the foreground
CMD [ "nginx", "-g", "daemon off;" ]

FROM debian:buster

COPY ./conf/* /var/www/html/

RUN chmod +x /var/www/html/script.sh

# Execute the script
ENTRYPOINT [ "/var/www/html/script.sh" ]

# Start nginx Server in the foreground
CMD [ "nginx", "-g", "daemon off;" ]

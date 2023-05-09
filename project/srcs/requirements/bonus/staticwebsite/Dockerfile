FROM debian:buster

COPY ./conf/* /var/www/html/

RUN chmod +x /var/www/html/script.sh

ENTRYPOINT [ "/var/www/html/script.sh" ]

CMD [ "nginx", "-g", "daemon off;" ]

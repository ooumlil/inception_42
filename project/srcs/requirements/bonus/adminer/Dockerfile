FROM debian:buster

COPY ./script.sh /

RUN chmod +x /script.sh 

ENTRYPOINT [ "/script.sh" ]

CMD [ "php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]

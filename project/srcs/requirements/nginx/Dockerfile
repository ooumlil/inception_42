FROM debian:buster

COPY ./conf/script.sh /

RUN apt-get update >/dev/null 2>&1\
 && apt-get install -y nginx openssl >/dev/null 2>&1\
 && chmod +x /script.sh

COPY ./conf/server.conf /etc/nginx/conf.d

ENTRYPOINT [ "/script.sh" ]

CMD [ "nginx", "-g", "daemon off;" ]

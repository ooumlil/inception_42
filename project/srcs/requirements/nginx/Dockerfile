FROM debian:buster

# Install dependencies
RUN apt-get -qq update >/dev/null 2>&1\
 && apt-get -qq install -y nginx openssl >/dev/null 2>&1

COPY ./conf/script.sh /script.sh

RUN chmod +x /script.sh

COPY ./conf/server.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["/script.sh"]

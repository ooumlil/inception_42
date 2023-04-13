FROM debian:buster

# Install dependencies
RUN apt-get -qq update\
	&& apt-get -qq install -y nginx openssl

COPY ./conf/script.sh /script.sh

RUN chmod +x /script.sh

COPY ./conf/server.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["/script.sh"]

FROM debian:buster

# Install dependencies
RUN apt-get update\
	&& apt-get install -y nginx openssl

COPY ./conf/script.sh /home/script.sh

RUN chmod +x /home/script.sh

COPY ./conf/server.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["/home/script.sh"]

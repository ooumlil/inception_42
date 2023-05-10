FROM debian:buster

COPY installation.sh /

RUN chmod +x installation.sh

ENTRYPOINT [ "/installation.sh" ]

CMD [ "/cadvisor" ]
#!/bin/bash

# Generate a self-signed SSL certificate
openssl req -x509 -nodes -days 40\
		-newkey rsa:2048\
		-keyout $CERTS_KEY\
		-out $CERTS_\
		-subj "/C=MA"

# Start the web server
nginx -g 'daemon off;'

#!/bin/bash

# Generate a self-signed SSL certificate
openssl req -x509 -nodes -days 40\
		-newkey rsa:2048\
		-keyout $CERTS_KEY\
		-out $CERTS_\
		-subj "/C=MA"\
		>/dev/null 2>&1

echo "nginx has started successfully"

# Start the web server
exec "$@"

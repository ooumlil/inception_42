#!/bin/bash

apt-get update >/dev/null 2>&1

apt-get install -y nginx >/dev/null 2>&1

echo "static_website has started."

exec "$@"

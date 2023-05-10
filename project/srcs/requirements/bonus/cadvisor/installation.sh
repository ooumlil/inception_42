#!/bin/bash

apt-get update -y >/dev/null 2>&1

apt-get install -y wget >/dev/null 2>&1

wget "https://github.com/google/cadvisor/releases/download/v0.47.0/cadvisor-v0.47.0-linux-amd64" >/dev/null 2>&1

mv cadvisor-v0.47.0-linux-amd64 cadvisor

chmod +x cadvisor

echo "cadvisor has started."

exec "$@"

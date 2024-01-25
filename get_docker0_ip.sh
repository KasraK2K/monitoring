#!/bin/bash

DOCKER0_IP=$(ip addr show docker0 | awk '/inet /{print $2}' | cut -d'/' -f1)

if [ -z "$DOCKER0_IP" ]; then
    echo "Error: Docker0 IP not found."
    exit 1
fi

export DOCKER0_IP
echo "DOCKER0_IP=$DOCKER0_IP"

# chmod +x get_docker0_ip.sh
# source ./get_docker0_ip.sh

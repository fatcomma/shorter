#!/bin/bash

# Usage: ./deploy.sh [host]
# This script bootstraps a system by running install.sh

# Get hostname from commandline argument
HOST="${1:-ubuntu@ec2-50-112-237-34.us-west-2.compute.amazonaws.com}"
# Set path to key being used for server
KEY="/home/ryan/.ssh/id_rsa.pub" 

# Remove any existing entries from known_hosts
ssh-keygen -R "${HOST#*@}" 2> /dev/null

tar cj . | ssh -o 'StrictHostKeyChecking no' -i "$KEY" "$HOST" '
sudo rm -rf ~/chef &&
mkdir ~/chef &&
cd ~/chef &&
tar xj &&
sudo bash install.sh'

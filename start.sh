#!/usr/bin/env bash

# Get environment variables to show up in SSH session
eval $(printenv | sed -n "s/^\([^=]\+\)=\(.*\)$/export \1=\2/p" | sed 's/"/\\\"/g' | sed '/=/s//="/' | sed 's/$/"/' >> /etc/profile)

# Add SSH Port to config
sed -i "s/SSH_PORT/$SSH_PORT/g" /etc/ssh/sshd_config

# Start the SSH Service
echo "Starting SSH ..."
service ssh start

npm start
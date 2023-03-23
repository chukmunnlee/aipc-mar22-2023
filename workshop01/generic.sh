#!/bin/sh 
docker-machine create \
    --driver generic \
    --generic-ssh-user root \
    --generic-ip-address ip_address \
    --generic-ssh-key ssh_private_key \
    docker-nginx

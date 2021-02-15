#!/usr/bin/env bash

CONTAINER_NAME='traefik'

CID=$(docker ps -q -f status=running -f name=^/${CONTAINER_NAME}$)
if [ ! "${CID}" ]; then
  (cd ~/projects/traefik && docker-compose up -d)
fi
unset CID

(cd ~/projects/mysql && docker-compose up -d)
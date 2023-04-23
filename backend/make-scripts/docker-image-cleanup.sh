#!/usr/bin/env bash

printf "\e[33;1m%s\e[0m\n" 'Running the docker image cleanup'
docker rmi $(sudo docker images -f "dangling=true" -q)
if [ $? -ne 0 ]; then
  printf "\e[33;1m%s\e[0m\n" 'Nothing to remove'
  exit 0
fi

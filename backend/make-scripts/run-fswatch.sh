#!/usr/bin/env bash

function cleanup {
  printf "\e[33;1m%s\e[0m\n" 'Running.... docker cleanup'

  docker-compose down
  docker rmi $(docker images -f "dangling=true" -q)
  exit
}

function refresh_docker {
  printf "\e[33;1m%s\e[0m\n" 'Refreshing.... docker images'

  docker-compose down --remove-orphans --rmi all
  docker rmi $(docker images -f "dangling=true" -q)
  if [ $? -ne 0 ]; then
  printf "\e[33;1m%s\e[0m\n" 'Nothing to remove'
  exit 0
  fi
  docker-compose up --build -d

}

printf "\e[33;1m%s\e[0m\n" 'Running... docker'
# start docker setup
docker-compose up --build -d

# Run fswatch in the background and pipe its output to a while loop
fswatch -or -l 5 -i **/bin **/pubspec.* | while read; do
  refresh_docker
done

trap cleanup SIGINT SIGTERM

wait

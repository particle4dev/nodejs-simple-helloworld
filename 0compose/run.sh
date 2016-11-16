#!/bin/bash

arg='up -d'

for i in "$@"
do
case $i in
  -b|--build)
  arg="$arg --build"
  shift # past argument
  ;;
  --default)
  DEFAULT=YES
  ;;
  *)
  # unknown option
  ;;
esac
shift # past argument or value
done

docker-compose -f ./0compose/docker-compose.yml $arg "${@}"

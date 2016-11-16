#!/bin/bash

arg="false"

for i in "$@"
do
case $i in
  -r|--rm)
  arg="true"
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

docker-compose -f ./0compose/docker-compose.yml stop

if [ "$arg" = true ]; then
  docker-compose -f ./0compose/docker-compose.yml rm -f
fi

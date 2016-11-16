#!/bin/bash

docker exec -it $(docker-compose -f ./0compose/docker-compose.yml ps | grep $1 | awk '{print $1}') ${@:2} bash

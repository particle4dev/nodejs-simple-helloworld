#!/bin/bash

docker-compose -f ./0compose/docker-compose.yml logs -f  "${@}"

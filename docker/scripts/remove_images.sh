#!/usr/bin/env bash

# stop and remove containers(required to remove images)
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

# force remove all images
docker rmi -f $(docker images -q)

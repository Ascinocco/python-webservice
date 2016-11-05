#!/usr/bin/env bash

# stop and remove containers if they exist
docker stop $(docker ps -a -q)

docker run -t -i ubuntu:14.04 /bin/bash
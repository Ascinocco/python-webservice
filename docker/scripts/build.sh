#!/usr/bin/env bash

# stop and remove containers if they exist
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

# build the image
docker build -t ubuntu:16.04 ./

# tag the new image
docker tag ubuntu:16.04 anthonyscinocco:python-uuid

docker run -v ~/Documents/Personal/Projects/niall-challenge/python-webservice/app/:/var/www/html \
-d -p 80:80 anthonyscinocco/python-uuid /usr/sbin/apache2ctl -D FOREGROUND
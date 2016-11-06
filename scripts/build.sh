#!/usr/bin/env bash
PATH_TO_APP="/Users/anthony/Documents/Personal/Projects/niall-challenge/python-webservice/app"

docker stop $(docker ps -a -q)
docker rm $(socker ps -a -q)

docker build -t anthonyscinocco/python-uuid:webpy .

docker run -d -v "$(echo $PATH_TO_APP)":/var/www/html/python_uuid.com/application \
-p 80:80 anthonyscinocco/python-uuid:webpy /usr/sbin/apache2ctl -D FOREGROUND
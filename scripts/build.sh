#!/usr/bin/env bash
PATH_TO_APP="`pwd`/app"

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

docker build -t anthonyscinocco/python-uuid:webpy .

docker run \
    -d \
    -v ${PATH_TO_APP}:/var/www/html/python_uuid.com/application \
    -p 80:80 \
    --name uuid_webservice \
    anthonyscinocco/python-uuid:webpy \
    /usr/sbin/apache2ctl -D FOREGROUND

# Dockerized Python Webservice to generate random a UUID and output it to a web page
### Author: Anthony Scinocco
### Last Updated: 10/28/2016

### Note: Utilize python framework as setting up python to work as a cgi script is overly complex

### Helpful docker commands

# pulls in image and builds it with my docker file
# container -t means tag(14.04) and the . means the Dockerfile in the current directory
docker build -t ubuntu:16.04 .

# tag image so that it can be uploaded to docker hub
docker tag ubuntu:14.04 anthonyscinocco:python-uuid

#run docker image and open bash prompt
docker run -t -i ubuntu:14.04 /bin/bash

#docker run -t -i ubuntu:14.04 /bin/bash
#create new container using our image. -t is pseudo tty(???) -i is interactive
docker run -t -i anthonyscinocco:python-uuid

# stop and remove all docker containers
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

# remove image from host
docker rmi anthonyscinocco:python-uuid

#remove all images
docker rmi $(docker images -q)

#force remove all images (will remove them even if they're from a remote repo)
docker rmi -f $(docker images -q)

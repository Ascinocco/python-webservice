# Helpful example docker commands

### pulls in image and builds it with my docker file
### container -t means tag(14.04) and the . means the Dockerfile in the current directory
1. docker build -t name:tag .

### run docker image and open bash prompt
1. docker run -t -i ubuntu:14.04 /bin/bash

# stop and remove all docker containers
1. docker stop $(docker ps -a -q)
2. docker rm $(docker ps -a -q)

### remove image from host
1. docker rmi <image_name>

#remove all images
docker rmi $(docker images -q)

#force remove all images (will remove them even if they're from a remote repo)
docker rmi -f $(docker images -q)
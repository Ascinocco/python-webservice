#!/usr/bin/env bash

# remove all containers
docker rm $(docker ps -a -q)
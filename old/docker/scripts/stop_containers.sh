#!/usr/bin/env bash

# stops all containers
docker stop $(docker ps -a -q)
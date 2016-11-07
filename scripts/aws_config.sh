#!/usr/bin/env bash

# install packages and add default user to docker group, then reboot for docker to work
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt install -y docker.io
sudo apt install -y docker
sudo usermod -a -G docker ubuntu
sudo shutdown -r now
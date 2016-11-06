FROM ubuntu:14.04

MAINTAINER Anthony Scinocco <scinocco.a@gmail.com> Version 0.1

# get packages
RUN apt-get update -y
RUN apt-get install -y python-pip apache2 libapache2-mod-wsgi
RUN pip install virtualenv
RUN mkdir /var/www/python_uuid && virtualenv python_uuid_env && source python_uuid_env/bin/activate && \
    pip install django && django-admin.py startproject python_uuid .

COPY ./settings.py /var/www/python_uuid/python_uuid_env

RUN /var/www/python_uuid/python_uuid_env/./manage.py makemigrations && \
    /var/www/python_uuid/python_uuid_env/./manage.py migrate
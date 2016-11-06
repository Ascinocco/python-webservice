FROM ubuntu:14.04

MAINTAINER Anthony Scinocco <scinocco.a@gmail.com> Version: 0.1

# run updates and upgrades
RUN apt-get update -y && apt-get upgrade -y

# install packages needed to run server
RUN apt-get install -y apache2 python-setuptools libapache2-mod-wsgi python-webpy

# make application direcotories
RUN mkdir /var/www/html/python_uuid.com && mkdir /var/www/html/python_uuid.com/application && \
    mkdir /var/www/html/python_uuid.com/application/public

# copy over files
COPY ./app/application.wsgi /var/www/html/python_uuid.com/application
COPY ./app/application.py /var/www/html/python_uuid.com/application
COPY ./sites-available/000-default.conf /etc/apache2/sites-available/

# set apache env
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock
ENV APACHE_PID_FILE /var/run/apache2

# open up port 80
EXPOSE 80

# resart apache so changes take effect
RUN service apache2 restart
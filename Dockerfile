FROM ubuntu:14.04

MAINTAINER Anthony Scinocco <scinocco.a@gmail.com> Version: 0.1

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y apache2 python-setuptools libapache2-mod-wsgi python-webpy
RUN mkdir /var/www/html/python_uuid.com && mkdir /var/www/html/python_uuid.com/application && \
    mkdir /var/www/html/python_uuid.com/application/public

COPY ./app/application.wsgi /var/www/html/python_uuid.com/application
COPY ./app/application.py /var/www/html/python_uuid.com/application
COPY ./sites-available/000-default.conf /etc/apache2/sites-available/

# set apache env
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock
ENV APACHE_PID_FILE /var/run/apache2

EXPOSE 80

RUN service apache2 restart
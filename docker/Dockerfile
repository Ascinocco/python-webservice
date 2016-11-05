# Apache running on ubuntu with python and flask
FROM ubuntu:16.04

MAINTAINER Anthony Scinocco <scinocco.a@gmail.com> Version: 0.1

#a2enmod wsgi && \

# install what we need
RUN apt-get update && apt-get upgrade -y && \
    apt-get install nano && \
    apt-get install -y apache2 && apt-get install -y libapache2-mod-wsgi && \
    python-dev && apt-get install -y python-pip && pip install install Flask && \
    rm -f /var/www/html/index.html && mkdir /var/www/html/python_uuid && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \

# set apache env
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock
ENV APACHE_PID_FILE /var/run/apache2

# expose port 80
EXPOSE 80
#
## copy apache config
COPY ./apache-conf/httpd.conf /etc/apache2/apache2.conf
#
## copy permissions script
#COPY ./scripts/permissions.sh /root/permissions.sh
#CMD /root/permissions.sh
#

# copy wsgi config to application directory
COPY ./flask-conf/app.wsgi /var/www/html/python_uuid

# not exposing the port for some reason...
#not sure why
# runs apache executable with the
#CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]



#add executable permisions to bootstrap file
#RUN chmod +x /scripts/bootstrap.sh
#
#RUN ./scripts/bootstrap.sh
FROM debian:sid-slim
MAINTAINER Andra Necula <andra.necula@eaudeweb.ro>

# Install apache, PHP, and supplimentary programs. openssh-server, curl, and lynx-cur are for debugging the container.
RUN apt-get update \
    && apt-get -y upgrade \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    apache2 php7.0 php7.0-mysql libapache2-mod-php7.0 curl lynx-cur

# Enable apache mods.
RUN a2enmod php7.0
RUN a2enmod rewrite
#RUN rm -rf /var/www/html/
#ADD html /var/www/

#ENTRYPOINT [""]

# Manually set up the apache environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

EXPOSE 80

# By default, simply start apache.
RUN service apache2 start
RUN service apache2 status

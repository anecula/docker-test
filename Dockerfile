FROM  httpd:2.4


# Enable apache mods.
RUN a2enmod php7.0
RUN a2enmod rewrite
RUN rm /var/www/html/*
COPY  html/index/html  /var/www/index.html

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

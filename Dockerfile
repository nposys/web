FROM ubuntu:18.04

MAINTAINER "nposys" <info@nposys.ru>

ENV container docker

RUN apt-get update
RUN apt-get install -y tzdata
RUN dpkg-reconfigure --frontend noninteractive tzdata
RUN apt-get install -y mc
RUN apt-get install htop
RUN apt-get install -y curl
RUN apt-get install -y net-tools
RUN apt-get install -y php
RUN apt-get install -y php-mbstring
RUN apt-get install -y php-dom
RUN apt-get install -y php-xdebug
RUN apt-get install -y php-pgsql
RUN apt-get install -y php-curl
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ARG DEBIAN_FRONTEND=noninteractive

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

RUN apt-get install -y cron
RUN apt-get -y install exim4

RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN apt-get install -y libpng-dev

RUN a2enmod rewrite

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
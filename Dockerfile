FROM ubuntu:18.04

MAINTAINER "nposys" <info@nposys.ru>

ENV container docker

RUN apt-get update

RUN apt-get install -y tzdata

RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get install -y mc

RUN apt-get install htop

RUN apt-get install -y net-tools

RUN apt-get install -y php

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
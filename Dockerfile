FROM ubuntu:18.04

MAINTAINER "nposys" <info@nposys.ru>

ENV container docker

RUN apt-get update

RUN apt-get install -y mc

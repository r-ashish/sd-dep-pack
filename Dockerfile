# Set the base image
FROM ubuntu:trusty
# Dockerfile author / maintainer 
MAINTAINER Ashish <ashishranjan2912@gmail.com> 

# Update the default application repository sources list
RUN apt-get update && apt-get -y upgrade && apt-get install -y \
  libssl-dev libffi-dev python-pip libmysqlclient-dev \
  build-essential python python-dev ruby ruby-dev \
  curl git libxml2 libxml2-dev libxslt1-dev libfreetype6-dev && apt-get clean

RUN apt-get install -y openjdk-7-jdk
RUN apt-get install -y libxi6 libgconf-2-4

RUN apt-get install -y python-software-properties
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
RUN apt-get install -y nodejs

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN curl -sSL https://get.rvm.io | sudo bash -s stable
RUN /bin/bash -l -c ". /etc/profile.d/rvm.sh && rvm install 2.4.0 && rvm rubygems 2.6.14"

# RUN pip install virtualenv
# Set the base image
FROM ubuntu:trusty
# Dockerfile author / maintainer 
MAINTAINER Ashish <ashishranjan2912@gmail.com>

# Update the default application repository sources list
RUN apt-get update && apt-get -y upgrade && apt-get install -y \
  libssl-dev libffi-dev python-pip libmysqlclient-dev \
  build-essential python python-dev ruby ruby-dev \
  curl git libxml2 libxml2-dev libxslt1-dev libfreetype6-dev && apt-get clean

RUN apt-get install -y python-software-properties software-properties-common
RUN sudo pip install virtualenv
# deps for selenium
RUN add-apt-repository -y ppa:webupd8team/java && apt-get update
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
RUN apt-get install -y oracle-java8-installer
# install node 6.latest
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
RUN apt-get install -y nodejs
RUN npm install jasmine-node -g
# install ruby, gems
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN curl -sSL https://get.rvm.io | sudo bash -s stable
RUN /bin/bash -l -c ". /etc/profile.d/rvm.sh && rvm install 2.4.0 && rvm rubygems 2.6.14"

# install chrome
RUN echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list.d/google.list
RUN apt-get install -y wget && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
RUN apt-get update && apt-get install -y libxpm4 libxrender1 libgtk2.0-0 libnss3 libgconf-2-4
RUN apt-get update && apt-get install -y google-chrome-stable
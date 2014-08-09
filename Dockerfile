FROM ubuntu:latest
MAINTAINER joe@djeebus.net

RUN echo "deb http://us.archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
RUN echo "deb http://us.archive.ubuntu.com/ubuntu precise multiverse" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y supervisor
RUN apt-get install -y python-cheetah python-openssl unzip unrar par2
RUN apt-get install -y deluged deluge-web python-setuptools

ADD supervisor/supervisor.conf /etc/supervisor/conf.d/

ADD sabnzbd /opt/sabnzbd
ADD supervisor/sabnzbd.conf /etc/supervisor/conf.d/

ADD htpc-manager /opt/htpc-manager
ADD supervisor/htpc-manager.conf /etc/supervisor/conf.d/

ADD sickbeard /opt/sickbeard
ADD supervisor/sickbeard.conf /etc/supervisor/conf.d/

ADD headphones /opt/headphones
ADD supervisor/headphones.conf /etc/supervisor/conf.d/

ADD couchpotato /opt/couchpotato
ADD supervisor/couchpotato.conf /etc/supervisor/conf.d/

ADD supervisor/deluge.conf /etc/supervisor/conf.d/

RUN apt-get install -y nginx
ADD nginx /opt/nginx
ADD supervisor/nginx.conf /etc/supervisor/conf.d/

RUN mkdir /mnt/p2p

CMD [ "/usr/bin/supervisord" ]

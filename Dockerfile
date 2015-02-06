FROM ubuntu:latest
MAINTAINER joe@djeebus.net

RUN echo "deb http://us.archive.ubuntu.com/ubuntu trusty universe" >> /etc/apt/sources.list
RUN echo "deb http://us.archive.ubuntu.com/ubuntu trusty multiverse" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:deluge-team/ppa

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y supervisor
RUN apt-get install -y python-cheetah python-openssl unzip unrar par2
RUN apt-get install -y deluged deluge-webui
RUN apt-get install -y python-setuptools python-pip python-dev build-essential
RUN apt-get install -y xz-utils xdg-utils imagemagick wget
RUN pip install psutil

RUN apt-get install -y nginx
RUN /etc/init.d/nginx stop
RUN update-rc.d -f nginx disable
EXPOSE 80 443

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

RUN wget -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py | \
	sudo python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"
ADD supervisor/calibre.conf /etc/supervisor/conf.d/

ADD supervisor/deluge.conf /etc/supervisor/conf.d/

ADD nginx /opt/nginx
ADD supervisor/nginx.conf /etc/supervisor/conf.d/

RUN mkdir /mnt/p2p

CMD [ "/usr/bin/supervisord" ]

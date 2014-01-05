#!/bin/bash

# clean up old utorrent server
rm utorrent* -Rf

# download new utorrent server
wget http://download-new.utorrent.com/endpoint/utserver/os/linux-x64-ubuntu-13-04/track/beta/ -O utorrent-server.tar.gz
tar xvf utorrent-server.tar.gz
mv utorrent-server-* utorrent

docker build -t djeebus/htpc-container .

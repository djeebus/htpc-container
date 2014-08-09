#!/bin/bash

HOST_NAME=htpc-downloader.local


BASE_FILE=nginx/ssl

if [ ! -f $BASE_FILE.key ] || [ ! -f $BASE_FILE.crt ]
then
	openssl req -new \
        	-newkey rsa:4096 \
	        -days 365 \
	        -nodes -x509 \
	        -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=$HOST_NAME" \
	        -keyout $BASE_FILE.key \
	        -out $BASE_FILE.crt
fi

docker build -t djeebus/htpc-container .

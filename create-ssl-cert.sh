#!/bin/bash

BASE_FILE=nginx/ssl

HOST_NAME=htpc-downloader.local

openssl req -new \
	-newkey rsa:4096 \
	-days 365 \
	-nodes -x509 \
	-subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=$HOST_NAME" \
	-keyout $BASE_FILE.key \
	-out $BASE_FILE.crt

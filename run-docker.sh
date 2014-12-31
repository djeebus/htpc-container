#!/bin/bash

PID_FILE=/var/run/htpc-manager.pid

#if [ -e $PID_FILE ]
#then
#	echo "HTPC manager running, killing it ... "
#	HTPC_ID=$(cat $PID_FILE)
#	docker kill $HTPC_ID
#	docker rm htpc
#	rm $PID_FILE
#fi

RUN_OPTIONS="-a stdout --name=htpc"

# add supervisord port
RUN_OPTIONS="$RUN_OPTIONS -p 0.0.0.0:9000:9000"

# add torrent ports
RUN_OPTIONS="$RUN_OPTIONS -p 0.0.0.0:6881:6881"
RUN_OPTIONS="$RUN_OPTIONS -p 0.0.0.0:6882:6882"
RUN_OPTIONS="$RUN_OPTIONS -p 0.0.0.0:6883:6883"
RUN_OPTIONS="$RUN_OPTIONS -p 0.0.0.0:6884:6884"
RUN_OPTIONS="$RUN_OPTIONS -p 0.0.0.0:6885:6885"
RUN_OPTIONS="$RUN_OPTIONS -p 0.0.0.0:6886:6886"
RUN_OPTIONS="$RUN_OPTIONS -p 0.0.0.0:6887:6887"
RUN_OPTIONS="$RUN_OPTIONS -p 0.0.0.0:6888:6888"
RUN_OPTIONS="$RUN_OPTIONS -p 0.0.0.0:6889:6889"
RUN_OPTIONS="$RUN_OPTIONS -p 0.0.0.0:6890:6890"
RUN_OPTIONS="$RUN_OPTIONS -p 0.0.0.0:6891:6891"

# add nginx ports
RUN_OPTIONS="$RUN_OPTIONS -p 0.0.0.0:80:80"
RUN_OPTIONS="$RUN_OPTIONS -p 0.0.0.0:443:443"

# add config mount
RUN_OPTIONS="$RUN_OPTIONS -v /mnt/htpc/:/var/htpc"

# add shared folder mounts
RUN_OPTIONS="$RUN_OPTIONS -v /mnt/p2p:/mnt/p2p"
RUN_OPTIONS="$RUN_OPTIONS -v /mnt/video:/mnt/video"


echo "Starting HTPC manager"
image_id=$(docker run $RUN_OPTIONS djeebus/htpc-container)

echo $image_id >> $PID_FILE

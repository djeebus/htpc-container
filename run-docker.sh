#!/bin/bash

PID_FILE=/var/run/htpc-manager.pid

if [ -e $PID_FILE ]
then
	echo "HTPC manager running, killing it ... "
	HTPC_ID=$(cat $PID_FILE)
	sudo docker kill $HTPC_ID
	rm $PID_FILE
fi

RUN_OPTIONS="-d"

# add supervisord port
RUN_OPTIONS="$RUN_OPTIONS -p 9000:9000"

# add htpc manager port
RUN_OPTIONS="$RUN_OPTIONS -p 888:8080"

# add sabnzbd port
RUN_OPTIONS="$RUN_OPTIONS -p 8000:8000"

# add sickbeard port
RUN_OPTIONS="$RUN_OPTIONS -p 8001:8001"

# add couchpotato port
RUN_OPTIONS="$RUN_OPTIONS -p 5050:5050"

# add headphones port
RUN_OPTIONS="$RUN_OPTIONS -p 8003:8003"

# add deluge web ui port
RUN_OPTIONS="$RUN_OPTIONS -p 8112:8112"

# add deluged api port
RUN_OPTIONS="$RUN_OPTIONS -p 58846:58846"
# add torrent ports
RUN_OPTIONS="$RUN_OPTIONS -p 6881:6881"
RUN_OPTIONS="$RUN_OPTIONS -p 6882:6882"
RUN_OPTIONS="$RUN_OPTIONS -p 6883:6883"
RUN_OPTIONS="$RUN_OPTIONS -p 6884:6884"
RUN_OPTIONS="$RUN_OPTIONS -p 6885:6885"
RUN_OPTIONS="$RUN_OPTIONS -p 6886:6886"
RUN_OPTIONS="$RUN_OPTIONS -p 6887:6887"
RUN_OPTIONS="$RUN_OPTIONS -p 6888:6888"
RUN_OPTIONS="$RUN_OPTIONS -p 6889:6889"
RUN_OPTIONS="$RUN_OPTIONS -p 6890:6890"
RUN_OPTIONS="$RUN_OPTIONS -p 6891:6891"

# add config mount
RUN_OPTIONS="$RUN_OPTIONS -v /var/htpc:/var/htpc"

# add data mount
RUN_OPTIONS="$RUN_OPTIONS -v /mnt/p2p:/mnt/p2p"

echo "Starting HTPC manager"
image_id=$(docker run $RUN_OPTIONS djeebus/htpc-container)

echo $image_id >> $PID_FILE

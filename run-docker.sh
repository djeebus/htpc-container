#!/bin/bash

RUN_OPTIONS="-d"

# add supervisord port
RUN_OPTIONS="$RUN_OPTIONS -p 9000:9000"

# add htpc manager port
RUN_OPTIONS="$RUN_OPTIONS -p 80:8080"

# add sabnzbd port
RUN_OPTIONS="$RUN_OPTIONS -p 8000:8000"

# add sickbeard port
RUN_OPTIONS="$RUN_OPTIONS -p 8001:8001"

# add couchpotato port
RUN_OPTIONS="$RUN_OPTIONS -p 5050:5050"

# add headphones port
RUN_OPTIONS="$RUN_OPTIONS -p 8003:8003"

# add config mount
RUN_OPTIONS="$RUN_OPTIONS -v /var/htpc:/var/htpc"

# add data mount
RUN_OPTIONS="$RUN_OPTIONS -v /mnt/p2p:/mnt/p2p"


docker run $RUN_OPTIONS djeebus/htpc-container

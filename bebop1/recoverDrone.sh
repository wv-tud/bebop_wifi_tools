#!/bin/bash

if [ -z "$1" ]
then
IP="192.168.42.1"
echo "No drone ID specified, using ($IP)"
else
IP="192.168.40.$1"
echo "Drone ID specified, using ($IP)"
fi

{ echo "mount -o remount,rw /"; echo "mv /data/ftp/internal_000/scripts/rcS_backup /etc/init.d/rcS"; echo "chmod a+x /etc/init.d/rcS"; echo "sh /bin/ardrone3_shutdown.sh"; sleep 10; } | telnet $IP

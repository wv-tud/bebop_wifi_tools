#!/bin/bash

if [ -z "$1" ]
then
IP="192.168.42.1"
echo "No drone ID specified, using ($IP)"
else
IP="192.168.40.$1"
echo "Drone ID specified, using ($IP)"
fi

wput -u ./connect2hub ftp://$IP/internal_000/scripts/connect2hub
wput -u ./rcS ftp://$IP/internal_000/scripts/rcS
{ echo "mount -o remount,rw /"; echo "cp /etc/init.d/rcS /data/ftp/internal_000/scripts/rcS_backup"; echo "mv /data/ftp/internal_000/scripts/rcS /etc/init.d/rcS"; echo "chmod a+x /etc/init.d/rcS"; echo "chmod a+x /data/ftp/internal_000/scripts/connect2hub"; sleep 10; } | telnet $IP

#!/bin/bash

if [ -z "$1" ]
then
IP="192.168.42.1"
echo "No drone ID specified, using ($IP)"
else
IP="192.168.40.$1"
echo "Drone ID specified, using ($IP)"
fi

wput -u ./scripts/start_telnet_adb ftp://$IP/internal_000/scripts/connect2hub
{ echo "mount -o remount,rw /";  echo "sed -i 's|^exit 0|/data/ftp/internal_000/scripts/connect2hub \& exit 0|' /etc/init.d/rcS"; echo "chmod a+x /etc/init.d/rcS"; echo "chmod a+x /data/ftp/internal_000/scripts/connect2hub"; echo "/sbin/reboot"; sleep 10; } | telnet $IP

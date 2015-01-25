#!/bin/bash
#
# capture from internal cam
#
# check if tmp directory exists.
# if not create it and use ramdisk 15
#
if [ ! -d /home/pi/tmp ]
then
mkdir /home/pi/tmp
sudo mount -t tmpfs /dev/ram15 /home/pi/tmp
sudo chgrp pi /home/pi/tmp/
sudo chown pi /home/pi/tmp/ 
fi
#
# check if tmp directory exists
# if it does, capture one image
# 
if [ -d /home/pi/tmp ] 
then
# for debug details
# raspistill -v -o /home/pi/tmp/test.jpeg
# for silent mode
raspistill -n -o /home/pi/tmp/test.jpeg
#
# copy the file to your server
#
scp /home/pi/tmp/test.jpeg  sune@192.168.1.21:/var/www/room/`date +%m`_`date +%b`_`date +%Y`/`date +%d`/cam0_`date +%Y`_`date +%b`_`date +%d`_`date +%H``date +%M`.jpeg
echo "Internal Cam" `date`
fi

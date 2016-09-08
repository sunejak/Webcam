#!/bin/bash
#
# capture from internal cam
#
delay=$1
if [[ ${delay} == "" ]] ; then
    echo "Usage:  internal_capture.sh delaytime"
    exit 1
fi
#
sleep ${delay}s
#
# check if tmp directory exists.
# if not create it and use ramdisk 15
#
if [ ! -d /home/pi/tmp ] ; then
    mkdir /home/pi/tmp
    sudo mount -t tmpfs /dev/ram15 /home/pi/tmp
    sudo chgrp pi /home/pi/tmp/
    sudo chown pi /home/pi/tmp/
fi
#
# check if tmp directory exists
# if it does, capture one image
# 
if [ -d /home/pi/tmp ] ; then
# for debug details
# raspistill -v -o /home/pi/tmp/test.jpeg
# for silent mode
    raspistill -n -o /home/pi/tmp/test_${delay}.jpeg
#
# copy the file to your server
#
    scp /home/pi/tmp/test_${delay}.jpeg  ttjsun@192.168.1.24:/var/www/html/garage.jpeg
    scp /home/pi/tmp/test_${delay}.jpeg  ttjsun@192.168.1.24:/var/www/html/garage/`date +%m`_`date +%b`_`date +%Y`/`date +%d`/cam0_`date +%Y`_`date +%b`_`date +%d`_`date +%H``date +%M`_${delay}.jpeg
    echo "Internal Cam" `date` ${delay}
fi

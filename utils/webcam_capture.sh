#
# capture from webCam
#
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
# if it does, capture ten images
# 
if [ -d /home/pi/tmp ] 
then
cd tmp
#
# check if device exists
#
if [ -c /dev/video0 ] 
then
streamer  -s 1280x960 -c /dev/video0  -w 2 -t 10 -o cam0_now00.jpeg >> logfile.out
scp cam0_now09.jpeg  sune@192.168.1.21:/var/www/garage/`date +%m`_`date +%b`_`date +%Y`/`date +%d`/cam0_`date +%Y`_`date +%b`_`date +%d`_`date +%H``date +%M`.jpeg
echo "Cam 0" `date`
fi
#
# check if device exists
#
if [ -c /dev/video1 ] 
then
streamer  -s 1280x960 -c /dev/video1  -w 2 -t 10 -o cam1_now10.jpeg >> logfile.out
scp cam1_now19.jpeg  sune@192.168.1.21:/var/www/garage/`date +%m`_`date +%b`_`date +%Y`/`date +%d`/cam1_`date +%Y`_`date +%b`_`date +%d`_`date +%H``date +%M`.jpeg
echo "Cam 1" `date`
fi
fi

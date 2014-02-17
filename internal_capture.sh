#
# capture from internal cam
#
if [ ! -d /home/pi/tmp ]
then
mkdir /home/pi/tmp
sudo chgrp /home/pi/tmp/ pi
sudo chown /home/pi/tmp/ pi
sudo mount -t tmpfs /dev/ram15 /home/pi/tmp
fi
 
if [ -d /home/pi/tmp ] 
then
raspistill -v -o /home/pi/tmp/test.jpeg
scp /home/pi/tmp/test.jpeg  sune@192.168.1.21:/var/www/room/`date +%m`_`date +%b`_`date +%Y`/`date +%d`/cam0_`date +%Y`_`date +%b`_`date +%d`_`date +%H``date +%M`.jpeg
echo "Cam 0" `date`
fi

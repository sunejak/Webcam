#
# capture from internal cam
#
if [ ! -d /home/pi/tmp ]
then
mkdir /home/pi/tmp
sudo mount -t tmpfs /dev/ram15 /home/pi/tmp
fi
 
if [ -d /home/pi/tmp ] 
then
raspistill -v -o test.jpeg
scp test.jpeg  sune@192.168.1.21:/var/www/garage/`date +%m`_`date +%b`_`date +%Y`/`date +%d`/cam0_`date +%Y`_`date +%b`_`date +%d`_`date +%H``date +%M`.jpeg
echo "Cam 0" `date`
fi

#!/bin/bash

lastfile=( $( ls -tr /var/www/html/backdoor/`date +%m`_`date +%b`_`date +%Y`/`date +%d`/cam* | tail -1 ) )
cp ${lastfile} /var/www/html/backdoor.jpeg 

lastfile=( $( ls -tr /var/www/html/garage/`date +%m`_`date +%b`_`date +%Y`/`date +%d`/cam* | tail -1 ) )
cp ${lastfile} /var/www/html/garage.jpeg 

lastfile=( $( ls -tr /var/www/html/yard/`date +%m`_`date +%b`_`date +%Y`/`date +%d`/cam* | tail -1 ) )
cp ${lastfile} /var/www/html/yard.jpeg 

cd /var/www/html

java -cp ~/scripts/utils-1.0-SNAPSHOT.jar com.sune.app.ScaleImage backdoor.jpeg 700 900
java -cp ~/scripts/utils-1.0-SNAPSHOT.jar com.sune.app.ScaleImage garage.jpeg 700 900
java -cp ~/scripts/utils-1.0-SNAPSHOT.jar com.sune.app.ScaleImage yard.jpeg 700 900

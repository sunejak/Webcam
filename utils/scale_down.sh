#!/bin/bash

yfactor=$3
if [[ ${yfactor} == "" ]] ; then
    echo "Usage: scale_down.sh filepattern xpixel ypixel"
    exit 1
fi
xfactor=$2
if [[ ${xfactor} == "" ]] ; then
    echo "Usage: scale_down.sh filepattern xpixel ypixel"
    exit 1
fi
filepattern=$1
if [[ ${filepattern} == "" ]] ; then
    echo "Usage: scale_down.sh filepattern xpixel ypixel"
    exit 1
fi

# array4=( $( ls cam0_2015_Apr_08_07*.jpeg) )
array4=( $( ls ${filepattern}) )
array4Len=(${#array4[@]})-1

echo Scale: $array4Len images to ${xfactor} ${yfactor}

for ((i=0; i<$array4Len; i++))  
do 
	echo $i  ${array4[$i]} 
	java -cp ~/scripts/utils-1.0-SNAPSHOT.jar com.sune.app.ScaleImage ${array4[$i]}  ${xfactor} ${yfactor}
done 

exit 0

#!/bin/bash

filepattern=$1
if [[ ${filepattern} == "" ]] ; then
    echo "Usage: Crop_over.sh filepattern x y h w"
    exit 1
fi
x=$2
if [[ ${x} == "" ]] ; then
    echo "Usage: Crop_over.sh filePattern x y h w"
    exit 1
fi
y=$3
if [[ ${y} == "" ]] ; then
    echo "Usage: Crop_over.sh filePattern x y h w"
    exit 1
fi
h=$4
if [[ ${h} == "" ]] ; then
    echo "Usage: Crop_over.sh filePattern x y h w"
    exit 1
fi
w=$5
if [[ ${w} == "" ]] ; then
    echo "Usage: Crop_over.sh filePattern x y h w"
    exit 1
fi

# array4=( $( ls cam0_2015_Apr_08_07*.jpeg) )
array4=( $( ls ${filepattern}) )
array4Len=(${#array4[@]})

echo Lenght: ${array4Len}

for ((i=0; i<$array4Len; i++))  
do 
	echo ${i}  ${array4[$i]}
	java  -Djava.awt.headless=true  -cp ~/2022/Webcam/utils/target/utils-1.1-SNAPSHOT.jar com.sune.app.SubImage ${array4[$i]}  ${x} ${y} ${h} ${w}
done
exit 0

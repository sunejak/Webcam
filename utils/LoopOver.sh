#!/bin/bash

filepattern=$1
if [[ ${filepattern} == "" ]] ; then
    echo "Usage: LoopOver.sh filePattern factor"
    exit 1
fi
factor=$2
if [[ ${factor} == "" ]] ; then
    echo "Usage: LoopOver.sh filePattern factor"
    exit 1
fi

# array4=( $( ls cam0_2015_Apr_08_07*.jpeg) )
array4=( $( ls ${filepattern}) )
array4Len=(${#array4[@]})-1

echo Lenght: ${array4Len}

for ((i=0; i<$array4Len; i++))  
do 
	echo ${i}  ${array4[$i]}  ${array4[$i+1]}
	java  -Djava.awt.headless=true  -cp ~/2022/Webcam/utils/target/utils-1.1-SNAPSHOT.jar com.sune.app.XorImages ${array4[$i]}  ${array4[$i+1]} diff_${array4[$i]} ${factor}
done 

exit 0

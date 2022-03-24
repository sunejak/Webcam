#!/bin/bash

filePattern=$1
if [[ ${filePattern} == "" ]] ; then
    echo "Usage: GenerateHtml.sh filePattern numOfCharToCut"
    exit 1
fi

cutNumber=$2
if [[ ${cutNumber} == "" ]] ; then
    echo "Usage: GenerateHtml.sh filePattern numOfCharToCut"
    exit 1
fi

fileList=$(ls ${filePattern})
declare -a array4=($fileList)
array4Len=${#array4[@]}

echo \<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\"\>

echo \<html\>
echo   \<head\> \<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"\> 
echo    \<title\>Server\</title\> \</head\>
echo    \<body bgcolor=\"#FFFFFF\"\>
echo      \<h1 align=\"center\"\>Images\</h1\>

for ((i=0; i<$array4Len; i++))  
do 
#	echo   ${array4[$i]} 
echo \<a href=\"./${array4[$i]:cutNumber}\"\>\<img src=\"./${array4[$i]}\" width=\"150\" height=\"170\" alt=\"tmp${i}\"\>\</a\>
done 

echo \</body\>
echo \</html\>

exit 0

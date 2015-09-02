#!/bin/bash

array4=( $( ls -rS diff_*.jpeg | tail -55 | sort) )
array4Len=(${#array4[@]})-1

echo \<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\"\>

echo \<html\>
echo   \<head\> \<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"\> 
echo    \<title\>sune-ws.no-ip.org\</title\> \</head\>
echo    \<body bgcolor=\"#FFFFFF\"\>
echo      \<h1 align=\"center\"\>Biggest diff images\</h1\>


# echo Lenght: $array4Len

for ((i=0; i<$array4Len; i++))  
do 
#	echo   ${array4[$i]} 
echo \<a href=\"./${array4[$i]:5}\"\>\<img src=\"./${array4[$i]}\" width=\"150\" height=\"170\" alt=\"tmp${i}\"\>\</a\>
done 

echo \</body\>
echo \</html\>

exit 0

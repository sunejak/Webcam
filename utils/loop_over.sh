source=cam*.jpeg; 

echo $source;

echo Process

for ((i=0; i < ${#source[@]}; i++))
do
  echo ${source[$i]}
done

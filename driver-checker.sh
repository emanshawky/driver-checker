#!/bin/bash

input=$1


if ! [ $input = new ] && ! [ $input = get ]  && ! [ $input = list ] ;
then
echo "Wrong user input! It should be one of the following "new/get/list"."
exit;
fi

case $input in 

new)

read -p "please enter user name: " name

read -p "please enter user age: " age

read -p "please enter user vision rate: " visionRate

if ! [ $age -gt 17 ]
  then
  echo "Sorry age should be 18 or more"
  result="not eligible"
  echo "$name:$age:$visionRate:$result" >> results.log
  exit;
  elif ! [ $visionRate -gt 3 ] 
  then
  echo "Sorry vision rate should be 4 or more"
  result="not eligible"
  echo "$name:$age:$visionRate:$result" >> results.log
  exit
fi

result="eligible"

echo "$name:$age:$visionRate:$result" >> results.log
;;
get)

read -p "please enter the user name: " name

#grep $name results.log || echo 

printf "%s\n" $name | grep -Ff - results.log | cut -f 1,4 -d :

;;
list)
cat results.log | cut -f 1,4 -d :

;;

esac
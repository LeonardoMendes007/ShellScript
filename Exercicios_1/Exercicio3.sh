#!/bin/bash

echo "Digite o nome do grupo"

read group;

echo ""
echo "O grupos são:"

users=$(grep  $group /etc/group | grep $group: | cut -f 4 -d ':' | tr ',' ' ' ) 

users+=" "

users+=$(cat /etc/passwd | cut -d: -f1 | grep $group)

date=$(date +%d-%m-%Y)

for user in $users
do

  #backup-usuario-DD-MM-YYYY.tar.gz
  tar "cvf" "backup-$user-$date.tar.gz" "/home/$user"

   

done

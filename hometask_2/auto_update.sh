#! /bin/bash

if (( $EUID )); then
  echo "Please, type root's password..."
  sudo "$0"
  exit
fi

while : ;do
    LOG=/var/log/update-`date "+%Y%m%y"`
    echo "UPDATE:" >> $LOG # дописати в кынець файла, з одним перезаписати файл
    apt-get update >> $LOG
    echo "UPGRADE:" >> $LOG
    apt-get -y upgrade >> $LOG
    sleep 7d
done


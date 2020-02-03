#!/bin/bash


if [[ -z "$1" ]];then
    echo "you must specify a source directory!"
elif [[ -z "$2" ]];then
    echo "you must specify a backup directory!"
fi

if  [[ ! -d $1 ]]; then
    echo "no such directory"
    exit 0
elif [[ ! -d $2 ]]; then
    mkdir $2
fi
DDIR=$2/`date "+%Y%m%d"`
if [[ ! -d $DDIR ]];then
    mkdir $DDIR
fi
for i in $(find $1 -mtime -1|sed '1d'); do
    cp $i $DDIR
done

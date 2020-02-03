#!/bin/bash
IP=`echo $1|cut -d"." -f1-3`
R=`echo "$1"|grep -o "{.*}"|tr -d {}|sed 's/0..//'`
:> /tmp/nc.log
for ((i=0;i<$R;i++));do 
    nc -vzw1 `echo "$IP.$i"` 80 &>> /tmp/nc.log
    nc -vzw1 `echo "$IP.$i"` 443 &>> /tmp/nc.log
done
cat /tmp/nc.log|grep succeeded

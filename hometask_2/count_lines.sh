#! /bin/bash
curl -s http://yoko.ukrtux.com:8899/versions.txt|sort |uniq -c |sort -r|head -n1

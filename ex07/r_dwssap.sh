#!/bin/bash
cat /etc/passwd \
|cut -d: -f-4,6-|tail -n +2  \
|awk -F: '{for (i =length($1);i>0;i--) rev = rev substr($1,i,1); $1=rev;rev = "";print }'  \
|sort -r \
|sed -n "${FT_LIGNE1},${FT_LIGNE2}p" \
|cut -d' ' -f1 \
|tr '\n' ','\
|sed 's/,/, /g; s/, $/./'
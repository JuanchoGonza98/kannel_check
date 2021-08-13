#!/bin/bash
#Author: JhonTheRipper98
#Date: 17-05-2021 last modified 17/06/2021
######
#Nagios Exit Codes
Flag() 
{
tail -n 3000 /home/kannel/log/smpp-destino.log | grep -q 'SMSC returned error code 0x00000401'
CHECK=$?
case ${CHECK} in
[0]*)
echo "WARNING..Saldo no disponible :("
exit 0
;;
[1]*)
echo "OK....Tenemos saldo :)"
exit 2
;;
*)
echo "UNKNOWN... no se reconoce entrada"
exit 3
;;
esac
} 
Flag

#!/bin/bash
##################################################################
## Simple script to get config info on eth0

## ver. 0.10 by Sebalinux - mario@sebalinux.it
##################################################################

## Get language
MYLANG=$(echo $LANG |cut -d_ -f1)

## Get configuration parameters
IP=$(ifconfig eth0 | awk '/inet addr/{print substr($2,6)}')
MASK=$(ifconfig eth0 | awk '/inet addr/{print substr($4,6)}')
GW=$(ip route show |grep default |grep eth0|cut -f3 -d" ")

## Display info
if [[ $MYLANG == "it" ]]
then
	zenity --info --title "Configurazione eth0" --text "Indirizzo IP : $IP \nNetmask     : $MASK \nGateway     : $GW" --width=300 --height=150 2>/dev/null
else
	zenity --info --title "ETH0 configuration" --text "IP Address   : $IP \nNetmask     : $MASK \nGateway     : $GW" --width=300 --height=150 2>/dev/null
fi


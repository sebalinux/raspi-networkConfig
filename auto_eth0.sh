#!/bin/bash
##################################################################
## Simple script to get automatic config on eth0

## ver. 0.10 by Sebalinux - mario@sebalinux.it
##################################################################

## Get language
MYLANG=$(echo $LANG |cut -d_ -f1)

## Configure eth0 with dhcp
dhclient eth0 >/dev/null 2>/dev/null

## Get eth0 info
IP=$(ifconfig eth0 | awk '/inet addr/{print substr($2,6)}')
MASK=$(ifconfig eth0 | awk '/inet addr/{print substr($4,6)}')
GW=$(ip route show |grep default |grep eth0|cut -f3 -d" ")

## Show dialog info
if [[ $MYLANG == "it" ]]
then
	zenity --info --title "Configurazione eth0" --text "Indirizzo IP : $IP \nNetmask     : $MASK \nGateway     : $GW" --width=300 --height=150 2>/dev/null
else
	zenity --info --title "ETH0 config" --text "IP Address : $IP \nNetmask    : $MASK \nGateway    : $GW" --width=300 --height=150 2>/dev/null
fi

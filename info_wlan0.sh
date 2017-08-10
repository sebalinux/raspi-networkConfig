#!/bin/bash
##################################################################
## Simple script to get config info on wlan0

## ver. 0.10 by Sebalinux - mario@sebalinux.it
##################################################################

IP=$(ifconfig wlan0 | awk '/inet addr/{print substr($2,6)}')
MASK=$(ifconfig wlan0 | awk '/inet addr/{print substr($4,6)}')
GW=$(ip route show |grep default |grep wlan0|cut -f3 -d" ")

zenity --info --title "Configurazione wlan0" --text "Indirizzo IP : $IP \nNetmask     : $MASK \nGateway     : $GW" 2>/dev/null

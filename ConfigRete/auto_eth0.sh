#!/bin/bash
##################################################################
## Simple script to get automatic config on eth0

## ver. 0.10 by Sebalinux - mario@sebalinux.it
##################################################################

dhclient eth0 >/dev/null 2>/dev/null
IP=$(ifconfig eth0 | awk '/inet addr/{print substr($2,6)}')
MASK=$(ifconfig eth0 | awk '/inet addr/{print substr($4,6)}')
GW=$(ip route show |grep default |grep eth0|cut -f3 -d" ")

zenity --info --title "Configurazione eth0" --text "Indirizzo IP : $IP \nNetmask     : $MASK \nGateway     : $GW" 2>/dev/null

#!/bin/bash
##################################################################
## Simple script to clear config on eth0

## ver. 0.10 by Sebalinux - mario@sebalinux.it
##################################################################

## Get language
MYLANG=$(echo $LANG |cut -d_ -f1)

## Clean config on eth0 and default route
ip addr flush dev eth0 >/dev/null 2>/dev/null
ip route delete default >/dev/null 2>/dev/null

## Show dialog info
if [[ $MYLANG == "it" ]]
then
	zenity --info --title "Pulizia eth0" --text "La configurazione e' stata azzerata" 2>/dev/null
else
	zenity --info --title "ETH0 Clean" --text "The eth0 configuration is now clean" 2>/dev/null
fi

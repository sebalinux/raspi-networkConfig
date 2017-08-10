#!/bin/bash
##################################################################
## Simple script to clear config on wlan0

## ver. 0.10 by Sebalinux - mario@sebalinux.it
##################################################################

ip addr flush dev wlan0 >/dev/null 2>/dev/null
ip route delete default >/dev/null 2>/dev/null

zenity --info --title "Pulizia wlan0" --text "La configurazione e' stata azzerata" 2>/dev/null

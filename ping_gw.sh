#!/bin/bash
################################################################################
## Script to ping default gateway

## Ver. 0.10 by Sebalinux - mario@sebalinux.it
################################################################################


## Get language
MYLANG=$(echo $LANG |cut -d_ -f1)


## Identify gateway
GATEWAY=$(netstat -rn |grep "^0.0.0.0" | grep eth0 |awk '{print $2}' |head -1)

RESULT=$(ping -c 4 $GATEWAY>/dev/null; echo $?)
if [[ $MYLANG == "it" ]]
then
    TEXT="Il gateway $GATEWAY e' raggiungibile"
    TEXTKO="Il gateway $GATEWAY NON e' raggiungibile"
    TITLE="Errore"
else
    TEXT="The gateway $GATEWAY is reachable"
    TEXTKO="The gateway $GATEWAY is unreachable"
    TITLE="Error"
fi

## Show dialog
if [[ $RESULT == 0 ]]
then
	zenity --info --title "OK" --text "$TEXT"  2>/dev/null
else
	zenity --error --title "$TITLE" --text "$TEXTKO" 2>/dev/null
fi
        


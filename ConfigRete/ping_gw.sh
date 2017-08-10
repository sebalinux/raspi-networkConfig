#!/bin/bash

## Identify gateway
GATEWAY=$(netstat -rn |grep "^0.0.0.0" | grep eth0 |awk '{print $2}' |head -1)

RESULT=$(ping -c 4 $GATEWAY>/dev/null; echo $?)
if (( $RESULT == 0 ))
then
	zenity --info --title "OK" --text "Il gateway $GATEWAY è raggiungibile"  2>/dev/null
else
	zenity --error --title "ERRORE" --text "Il gateway $GATEWAY NON è raggiungibile"  2>/dev/null
fi
        


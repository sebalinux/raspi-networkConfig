#!/bin/bash
##################################################################
## Simple script to ping an IP 

## ver. 0.10 by Sebalinux - mario@sebalinux.it
##################################################################
## Get language
MYLANG=$(echo $LANG |cut -d_ -f1)

if [[ $MYLANG == "it" ]]
then
	IP=$(zenity --entry --title "Ping IP" --text "Immetti l'indirizzo IP" --width=250 --height=150 2>/dev/null)
else
	IP=$(zenity --entry --title "Ping IP" --text "Insert IP address" --width=250 --height=150 2>/dev/null)
fi

if [[ $? == 1 ]]
then 
	exit
fi 

if [[ $MYLANG == "it" ]]
then
    TEXT="L'indirizzo $IP e' raggiungibile"
    TEXTKO="L'indirizzo $IP NON e' raggiungibile"
    TITLE="Errore"
else
    TEXT="The IP address $IP is reachable"
    TEXTKO="The IP address $IP is unreachable"
    TITLE="Error"
fi

RESULT=$(ping -c 4 $IP>/dev/null; echo $?)
if (( $RESULT == 0 ))
then
	zenity --info --title "OK" --text "$TEXT"  2>/dev/null
else
	zenity --error --title "$TITLE" --text "$TEXTKO"  2>/dev/null
fi


#!/bin/bash
##################################################################
## Simple script to ping an IP 

## ver. 0.10 by Sebalinux - mario@sebalinux.it
##################################################################

IP=$(zenity --entry --title "Ping IP" --text "Immetti l'indirizzo IP" --width=200 --height=150 2>/dev/null)
if [[ $? == 1 ]]
then 
	exit
fi 

RESULT=$(ping -c 4 $IP>/dev/null; echo $?)
if (( $RESULT == 0 ))
then
	zenity --info --title "OK" --text "L'indirizzo $IP e' raggiungibile"  2>/dev/null
else
	zenity --error --title "ERRORE" --text "L'indirizzo $IP NON e' raggiungibile"  2>/dev/null
fi


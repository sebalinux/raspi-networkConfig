#!/bin/bash
##################################################################
#     Simple script to ping an IP - version 0.10

#     Copyright (C) 2017 - Sebalinux (sebalinux at sebalinux dot it)

#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.

#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.

#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <http://www.gnu.org/licenses/>.
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


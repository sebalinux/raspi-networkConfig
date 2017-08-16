#!/bin/bash
##################################################################
#     Simple script to get config info on eth0 - version 0.10

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

## Get configuration parameters
IP=$(ifconfig eth0 | awk '/inet addr/{print substr($2,6)}')
MASK=$(ifconfig eth0 | awk '/inet addr/{print substr($4,6)}')
GW=$(ip route show |grep default |grep eth0|cut -f3 -d" ")

## Display info
if [[ $MYLANG == "it" ]]
then
	zenity --info --title "Configurazione eth0" --text "Indirizzo IP : $IP \nNetmask     : $MASK \nGateway     : $GW" --width=300 --height=150 2>/dev/null
else
	zenity --info --title "ETH0 configuration" --text "IP Address   : $IP \nNetmask     : $MASK \nGateway     : $GW" --width=300 --height=150 2>/dev/null
fi


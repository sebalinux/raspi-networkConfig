#!/bin/bash
##################################################################
#     Simple script to clear config on eth0 - version 0.10

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

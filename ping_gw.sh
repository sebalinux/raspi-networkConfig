#!/bin/bash
################################################################################
#     Script to ping default gateway - version 0.10

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
        


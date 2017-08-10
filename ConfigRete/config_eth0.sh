#!/bin/bash
##################################################################
## Simple script to configure eth0
## Network-Manager was disabled on eth0 (inserted mac address in NetworkManager.conf)

## ver. 0.10 by Sebalinux - mario@sebalinux.it
##################################################################

IP=$(zenity --entry --title "Indirizzo IP" --text "Immetti l'indirizzo IP" --width=400 --height=150 2>/dev/null)
if [[ $? == 1 ]]
then 
	exit
fi 
MASK=$(zenity --entry --title "Maschera/Netmask" --text "Immetti la maschera/netmask di rete" --entry-text "255.255.255.0" --width=400 --height=150 2>/dev/null)
if [[ $? == 1 ]]
then 
	exit
fi 
GW=$(zenity --entry --title "Gateway" --text "Immetti il gateway" --width=400 --height=150 2>/dev/null)
if [[ $? == 1 ]]
then 
	exit
fi 
OK=$(zenity --question --title "Confermi i dati?" --text "Indirizzo IP : $IP \nNetmask     : $MASK \nGateway     : $GW" 2>/dev/null)
if [[ $? == 1 ]]
then 
	exit
fi 

## Apply the configuration data to ETH0

ifconfig eth0 $IP netmask $MASK 
route add -net 0.0.0.0 gw $GW


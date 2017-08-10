#!/bin/bash
##################################################################
## Simple script to configure eth0
## Network-Manager was disabled on eth0 (inserted mac address in NetworkManager.conf)

## ver. 0.10 by Sebalinux - mario@sebalinux.it
##################################################################

## Get language
MYLANG=$(echo $LANG |cut -d_ -f1)

## Ask for IP Address
if [[ $MYLANG == "it" ]]
then 
	IP=$(zenity --entry --title "Indirizzo IP" --text "Immetti l'indirizzo IP" --width=400 --height=150 2>/dev/null)
else
	IP=$(zenity --entry --title "IP Address" --text "Inser the IP address" --width=400 --height=150 2>/dev/null)
fi
if [[ $? == 1 ]]
then 
	exit
fi 

## Ask for Network Mask
if [[ $MYLANG == "it" ]]
then
	MASK=$(zenity --entry --title "Maschera/Netmask" --text "Immetti la maschera/netmask di rete" --entry-text "255.255.255.0" --width=400 --height=150 2>/dev/null)
else
	MASK=$(zenity --entry --title "Network Mask" --text "Insert the network mask" --entry-text "255.255.255.0" --width=400 --height=150 2>/dev/null)
fi
if [[ $? == 1 ]]
then 
	exit
fi 

## Ask for the gateway
if [[ $MYLANG == "it" ]]
then
	GW=$(zenity --entry --title "Gateway" --text "Immetti il gateway" --width=400 --height=150 2>/dev/null)
else
	GW=$(zenity --entry --title "Gateway" --text "Insert the gateway" --width=400 --height=150 2>/dev/null)
fi
if [[ $? == 1 ]]
then 
	exit
fi 

## Show parameters and ask for confirm
if [[ $MYLANG == "it" ]]
then
	OK=$(zenity --question --title "Confermi i dati?" --text "Indirizzo IP : $IP \nNetmask     : $MASK \nGateway     : $GW" 2>/dev/null)
else
	OK=$(zenity --question --title "Do you confirm?" --text "IP Address   : $IP \nNetmask     : $MASK \nGateway     : $GW" 2>/dev/null)
fi

if [[ $? == 1 ]]
then 
	exit
fi 

## Apply the configuration data to ETH0
ip addr add $IP/$MASK dev eth0
ip route add default via $GW

#ifconfig eth0 $IP netmask $MASK 
#route add -net 0.0.0.0 gw $GW


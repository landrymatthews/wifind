#!/bin/bash

source /etc/hostapd/hostapd.conf
echo Router is current on channel $channel
if [ $channel -eq $1 ] ; then
	echo Router already on the BEST channel
else
	echo Router now switching to channel $1 
	sudo sed -i "/channel=/c\channel=$1" /etc/hostapd/hostapd.conf
	sudo hostapd_cli disable
	sudo hostapd_cli set channel $1
	sudo hostapd_cli enable
fi

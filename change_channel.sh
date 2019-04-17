#!/bin/bash
echo switching to channel $1 
sudo sed -i "/channel=/c\channel=$1" /etc/hostapd/hostapd.conf
sudo hostapd_cli disable
sudo hostapd_cli set channel $1
sudo hostapd_cli enable

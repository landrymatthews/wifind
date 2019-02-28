raspi-config
sudo raspi-config
reboot
sudo apt-get update
sudo apt-get upgrade
sudo rpi-update
reboot
sudo apt-get install dnsmasq hostapd
ifconfig
sudo vim /etc/dhcpcd.conf
sudo apt-get install vim
sudo vim /etc/network/interfaces
sudo vim /etc/dhcpcd.conf
sudo vim /etc/dnsmasq.conf
sudo vim /etc/hostapd/hostapd.conf
sudo vim /etc/default/hostapd 
sudo vim /etc/sysctl.conf
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo sh -c "iptables-save > /etc/iptables.ipv4.nat"
sudo vim /etc/rc.local
sudo /usr/sbin/hostapd /etc/hostapd/hostapd.conf 
reboot
iwconfig
vim change_channel.sh 
ls
sudo ./change_channel.sh 7
hostapd_cli reconfigure
sudo vim /etc/hostapd/hostapd.conf 
hostapd_cli reconfigure
sudo /usr/sbin/hostapd /etc/hostapd/hostapd.conf 
sudo /usr/sbin/hostapd /etc/hostapd/hostapd.conf > router.log
sudo /usr/sbin/hostapd /etc/hostapd/hostapd.conf
sudo /usr/sbin/hostapd /etc/hostapd/hostapd.conf > router.log &
cat router.log
hostapd_cli
cat router.log 
iwconfig
iwconfig wlan0
sudo iwconfig
sudo iwconfig wlan0
iw wlan0
iw wlan0 info
sudo vim /etc/hostapd/hostapd.conf 
iw wlan0 info
iw wlan0 info | grep channel
ps
kill -1 1149
cat router.log
ps aux
ps aux | grep hostapd
kill -1 1159
sudo kill -1 1159
iw wlan0 info
sudo kill -1 1163
iw wlan0 info
sudo kill -1 763
iw wlan0 info
sudo ifdown wlan0
iwconfig
sudo iwdown wlan0
sudo ifdown s
sudo ifconfig wlan0 down
sudo kill -1 1159
iw wlan0 info
sudo kill -1 763
sudo kill -1 1163
iw wlan0 info
sudo ifconfig wlan0 up
iw wlan0 info
hostapd_cli reconfigure
sudo hostapd_cli reconfigure
sudo hostapd_cli
iw wlan0 info
sudo hostapd_cli
vim change_channel.sh 
iw wlan0 info
sudo ./change_channel.sh 7
sudo ./change_channel.sh 3
cat router.log 
reboot
python

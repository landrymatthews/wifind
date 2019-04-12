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
ls
cat router.log
ls
cat what.txt
rm what.txt 
vim wifind.sh
ls
vim change_channel.sh 
vim wifind.sh 
ping -n 20 8.8.8.8
ping -c 5 -q $host
ping -c 5 -q 8.8.8.8
ipfm
sudo apt install ipfm
ipfm
sudo vim /etc/ipfm.conf
ipfm
sudo vim /etc/ipfm.conf
tcpdump
sudo apt install tcpdump
tcpdump
sudo tcpdump
man tcpdump
tshark
sudo apt install tshark
tshark
sudo apt install tshark
sudo apt-get install tshark
sudo apt-get update 
sudo apt-get install tshark
netstat -s 
netstat -s |grep retran
netstat -s |grep segments
tshark help
sudo tshark -Y "tcp.analysis.retransmission"
sudo tshark -Y "tcp.analysis.retransmission" -i wlan0
netstat -s | grep segments
man netstat
netstat -i
netstat
netstat -i
./change_channel.sh 3
netstat -i
history
sudo tshark -Y "tcp.analysis.retransmission"
sudo tshark -Y "tcp.analysis.retransmission" -i wlan0
history
ipfm
tcpdump
sudo tcpdump
sudo tcpdump -i wlan0
man tcpdump
iperf
sudo apt install iperf
iperf
iperf --help
iperf -v
sudo add-apt-repository "ppa:partickdk/general-lucid"
add-repository
add-apt
sudo apt-get install -y software-porperties-common
iperf
iperf -s
iperf --help
sudo iperf -u -B wlan0 -s
sudo iperf -u 
sudo iperf -s -u -B wlan0
sudo iperf -s -u 
sudo apt-get install slurm
slurm
slurm -g
slurm -h
slurm -i wlan0
slurm -h
slurm -i wlan0
slurm -i wlan0 | grep error
ifconfig
sudo cat /sys/class/net/wlan0/statistics/
sudo cat /sys/class/net/wlan0/statistics/tx_dropped 
sudo cat /sys/class/net/wlan0/statistics/tx_aborted_errors 
sudo cat /sys/class/net/wlan0/statistics/tx_carrier_errors 
sudo cat /sys/class/net/wlan0/statistics/tx_errors 
sudo cat /sys/class/net/wlan0/statistics/tx_packets 
sudo cat /sys/class/net/wlan0/statistics/tx_heartbeat_errors 
sudo cat /sys/class/net/wlan0/statistics/tx_fifo_errors 
netstat -s | grep segments
vim wifind.sh 
netstat -s | grep segments
netstat -i wlan0
netstat -i wlan0 -s
netstat -s -i wlan0
netstat -s
nstat
nstat -h
nstat -a
nstat
netstat
nstat
nstat -a
nstat
netstat -s
netstat -s | grep retransmitted
vim wifind.sh 
netstat -s | grep retransmitted
netstat
vim wifind.sh 
netstat -s | grep retransmitted
history 
vim wifind.sh 
chmod +x wifind.sh 
./wifind.sh 
netstat -s | grep retransmitted | awk '{print $1}'
vim wifind.sh 
netstat -s | grep retransmitted 
vim wifind.sh 
./wifind.sh 
vim wifind.sh 
./wifind.sh 
vim wifind.sh 
./wifind.sh 
vim wifind.sh 
./wifind.sh 
vim wifind.sh 
./wifind.sh 
vim wifind.sh 
./wifind.sh 
vim wifind.sh 
./wifind.sh 
vim wifind.sh
./wifind.sh 
vim wifind.sh
./wifind.sh 
vim wifind.sh
./wifind.sh 
vim wifind.sh
./wifind.sh 
vim wifind.sh
vim switchChannel.py
vim wifind.sh
./wifind.sh 
vim switchChannel.py 
./wifind.sh 
vim wifind.sh
vim specScan.py
vim wifind.sh
./wifind.sh 
vim wifind.sh

vim wifind.sh
./wifind.sh 
vim wifind.sh 
ls
lsmod
./wifind.sh
vim wifind.sh 
./wifind.sh

iwconfig
sudo ./change_channel.sh 11
iwlist
iwlist scan
wavemon 
sudo apt install wavemon
wavemon
sudo wavemon
iw scan
iw info
iw info | less
iw phy
iw phy | less
sudo iwlist wlan0 scan
sudo iwlist wlan0 scan |  less
sudo iwlist wlan0 scan | grep Frequency | sort | uniq -c | sort -n\
sudo iwlist wlan0 scan | grep Frequency | sort | uniq -c | sort -n
sudo iwlist wlan0 scan | grep Frequency | sort | uniq -c | sort -n > iwscan.txt
cat iwscan.txt 
sudo iw wlan0 scan | grep Frequency | sort | uniq -c | sort -n > iwscan.txt
cat iwscan.txt 
iw wlan0 scan | egrep 'SSID|signal'
sudo iw wlan0 scan | egrep 'SSID|signal'
sudo iw scan
sudo iw scan | grep whitesky
sudo iwlist scan | grep -e ESSID -e level
sudo iwlist wlan0 scan | grep -e ESSID -e level
sudo iw wlan0 scan \
sudo iw wlan0 scan 
sudo iwlist wlan0 scan | grep -e ESSID -e level -e channel
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency
sudo iw wlan0 scan | grep -e ESSID -e level -e Frequency
ls
cat 5
rm 5
ls
sudo iw wlan0 scan | grep -e ESSID -e level -e Frequency iwscan.txt
ls
sudo iw wlan0 scan | grep -e ESSID -e level -e Frequency > iwscan.txt
cat iwscan.txt 
sudo iw wlan0 scan | grep -e ESSID -e level -e Frequency >> iwscan.txt
cat iwscan.txt
sudo iw wlan0 scan | grep -e ESSID -e level -e Frequency
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency > iwscan.txt
cat iwscan.txt 
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | awk '{print $2 $3}'
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | awk '/Quality/ {print $2 $3}'
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency
sudo iwlist wlan0 scan | grep -e ESSID -e level -e *Channel
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency > iwscan.txt
sed 's/Quality.* ://'iwscan.txt
cat iwscan.txt 
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality.* ://'
history
cat iwscan.txt 
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=*/* Signal level=-/strength/'
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality//'
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=*|/|* Signal level=-/strength/'
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=*\/\* Signal level=-/strength/'
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=*\/\* Signal level=-/strength:/'
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency 
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=.* Signal level=-/strength:/'
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=.* Signal level=-/strength:/' 's/Frequency.* (//'
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=.* Signal level=-/strength:/' | sed 's/Frequency.* GHz//'
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=.* Signal level=-/strength:/' 
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=.* Signal level=-/strength:/' | sed 's/Frequency.* GHz//'
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=.* Signal level=-/strength:/' | sed 's/Frequency.* GHz //'
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=.* Signal level=-/strength:/' | sed 's/Frequency.* GHz //' | sed '/Frequency/3d'
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=.* Signal level=-/strength:/' | sed 's/Frequency.* GHz //' | sed 's/Frequency.*(Channel/Channel='
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=.* Signal level=-/strength:/' | sed 's/Frequency.* GHz //' | sed 's/Frequency.*(Channel/Channel=/'
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=.* Signal level=-/strength:/' | sed 's/Frequency.* GHz //' | sed -e '/Frequency/,+2d'
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=.* Signal level=-/strength:/' | sed 's/Frequency.* GHz //' | sed -e '/Frequency/,+2d' | sed -e 's/\(Channel (\d+)\)/channel:\1'
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=.* Signal level=-/strength:/' | sed 's/Frequency.* GHz //' | sed -e '/Frequency/,+2d' | sed -e 's/\(Channel (\d+)\)/channel:/1'
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=.* Signal level=-/strength:/' | sed 's/Frequency.* GHz //' | sed -e '/Frequency/,+2d' | sed -e 's/\(Channel (\d+)\)/channel:\1/'
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=.* Signal level=-/strength:/' | sed 's/Frequency.* GHz //' | sed -e '/Frequency/,+2d' | sed -e 's/\(Channel \(d+\)/channel:\1/'
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=.* Signal level=-/strength:/' | sed 's/Frequency.* GHz //' | sed -e '/Frequency/,+2d' | sed -e 's/(Channel \(d+\))/channel:\1/'
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=.* Signal level=-/strength:/' | sed 's/Frequency.* GHz //' | sed -e '/Frequency/,+2d' | sed -e 's/(Channel \(\d+\))/channel:\1/'
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=.* Signal level=-/strength:/' | sed 's/Frequency.* GHz //' | sed -e '/Frequency/,+2d' | sed -e 's/\(Channel (\d+)\)/channel:\1/'
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=.* Signal level=-/strength:/' | sed 's/Frequency.* GHz //' | sed -e '/Frequency/,+2d' | sed -e 's/\(Channel (.*)\)/channel:\1/'
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=.* Signal level=-/strength:/' | sed 's/Frequency.* GHz //' | sed -e '/Frequency/,+2d' | sed -E 's/\(Channel (.*)\)/channel:\1/'
sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=.* Signal level=-/strength:/' | sed 's/Frequency.* GHz //' | sed -e '/Frequency/,+2d' | sed -E 's/\(Channel (.*)\)/channel:\1/' > iwscan.txt
vim wifind.sh 
echo 'sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=.* Signal level=-/strength:/' | sed 's/Frequency.* GHz //' | sed -e '/Frequency/,+2d' | sed -E 's/\(Channel (.*)\)/channel:\1/' > iwscan.txt' >> wifind.sh 
echo 'sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=.* Signal level=-/strength:/' | sed 's/Frequency.* GHz //' | sed -e '/Frequency/,+2d' | sed -E 's/\(Channel (.*)\)/channel:\1/' > iwscan.txt' >> wifind.sh
echo "sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency | sed 's/Quality=.* Signal level=-/strength:/' | sed 's/Frequency.* GHz //' | sed -e '/Frequency/,+2d' | sed -E 's/\(Channel (.*)\)/channel:\1/' > iwscan.txt" >> wifind.sh
vim wifind.sh 
cat iwscan.txt 
sudo ./wifind.sh 
cat iwscan.txt 
sudo ./wifind.sh 
vim wifind.sh 
sudo ./wifind.sh 
vim wifind.sh 
cat iwscan_initial.txt 
cat iwscan.txt 
vim wifind.sh 
man sed
vim wifind.sh 
sudo ./wifind.sh 
cat iwscan.txt
vim wifind.sh 
sudo ./wifind.sh 
cat iwscan.txt
vim wifind.sh 
cat iwscan_initial.txt 
cat iwscan.txt
vim wifind.sh 
q
ls
cd ..
ls
cd pi
ls

sudo ./wifind.sh 
ls
vim wifind.sh 
sudo ./wifind.sh 
vim wifind.sh 
sudo ./wifind.sh 
ls 
rm 5
sudo ./wifind.sh 
ls
cd ..
ls
cd ..
ls
git
sudo apt install git
ls
cd home/pi
git add .
git init
git add .
git commit -m 'first push'
git config --global user.email "landry.matthews@gmail.com"
git config --global user.name "Landry Matthews"
git commit -m 'first push'
git push
git remote add https://github.com/landrymatthews/wifind.git
git remote add wifind https://github.com/landrymatthews/wifind.git
git push 
git push wifind
git push --set-upstream wifind master
ls
sudo poweroff
ls
exit
ls
ssh
sudo apt-get install openssh -server openssh-client
sudo apt-get install openssh-server openssh-client
sudo service ssh status
sudo service ssh start 
vim specplot.pdf 
ls
vim plotSpec.py 
ls
python plotSpec.py 
vim plotSpec.py 
python plotSpec.py 
sudo service sshstatus
sudo service ssh start 
sudo service ssh status
git pull upstream master
git pull
ls
vim adc_code.txt 
mv adc_code.txt adc_code.c
ls
mv pwm_code.py.txt pwm_code.py
ls
i2cdetect
raspi-config
sudo raspi-confifg
sudo raspi-config
vim plotSpec.py 
python plotSpec.py 
vim plotSpec.py 
python plotSpec.py 
vim plotSpec.py 
python plotSpec.py 
vim plotSpec.py 
python plotSpec.py 
ls
vim wifind.sh 
ls
vim wifind.sh 
ls
sudo ./wifind.sh 
vim wifind.sh 
sudo ./wifind.sh 
vim wifind.sh 
sudo ./wifind.sh 
vim wifind.sh
sudo ./wifind.sh 
vim plotSpec.py 
python plotSpec.py 
vim plotSpec.py 
python plotSpec.py 
vim plotSpec.py 
python plotSpec.py 
vim plotSpec.py 
python plotSpec.py 
vim plotSpec.py 
python plotSpec.py 
vim plotSpec.py 
python plotSpec.py 
vim plotSpec.py 
python plotSpec.py 
f
vim plotSpec.py 
python plotSpec.py 
vim plotSpec.py 
python plotSpec.py 
vim plotSpec.py 
python plotSpec.py 
vim plotSpec.py 
python plotSpec.py 
vim plotSpec.py 
python plotSpec.py 
vim plotSpec.py 
python plotSpec.py 
vim plotSpec.py 
python plotSpec.py 
vim plotSpec.py 
python plotSpec.py 
vim plotSpec.py 
python plotSpec.py 
vim plotSpec.py 
python plotSpec.py 
vim plotSpec.py 

python plotSpec.py 
ls
vim acc_test.sh 
ls
vim plotSpec.py 
vim adc_code.c 
vim wifind.sh 
./wifind.sh 
ls
cat retx_count.txt 
vim wifind.sh 
ls
vim switchChannel.py 
vim change_channel.sh 
cat /etc/hostapd/hostapd.conf | grep channel
vim plotSpec.py 
ls
vim adc_code.c 
vim adc.py 
python adc.py 
vim adc.py 
python adc.py 
vim adc.py 
cat specValues.csv 
vim specValues.csv 
ls
vim adcPlot.py 
vim adc.py 
vim plotSpec.py 
python adcPlot.py 
vim adcPlot.py 
python adcPlot.py 
vim adcPlot.py 
python adcPlot.py 
vim adcPlot.py 
python adcPlot.py 
vim adcPlot.py 
python adcPlot.py 
vim adcPlot.py 
python adcPlot.py 
vim adcPlot.py 
python adcPlot.py 
vim specP
vim plotSpec.py 
vim adcPlot.py 
vim plotSpec.py 
python adcPlot.py 
ls
git add .
git commit -m 'added adc stuff with andrew'
git push 
ping github.com
ping google.com
sudo reboot
lsmod
ls
logout
ls
cat /etc/hostapd/hostapd.conf 
ls
python specScan.py 
cat specScan.py 
ls
./wifind.sh 
sudo ./wifind.sh 
ls
python plotSpec.py 
ls
history
logout
cd
ls
cat pwm_code.py
python pwm_code.py 
vim pwm_code.py`
vim pwm_code.py
python pwm_code.py 
vim pwm_code.py
nano pwm_code.py
vim pwm_code.py
python pwm_code.py 
vim pwm_code.py\
vim pwm_code.py
python pwm_code.py 
vim pwm_code.py
python pwm_code.py 
vim pwm_code.py
python pwm_code.py 
vim pwm_code.py
python pwm_code.py 
vim pwm_code.py
python pwm_code.py 
vim pwm_code.py
python pwm_code.py
vim pwm_code.py
vim adc_code.c 
vim adc.py
python adc.py
pip install wiringpy
ping google.com
sudo apt install pip
pip install pip
sudo apt-get install pip
sudo apt-get install python3-pip
pip install wiringpi
pip
pip -v
sudo easy-install pip
sudo apt-get install python-setuptools
sudo easy-install pip
sudo easy_install pip
pip install wiringpi
sudo pip install wiringpi
gpio
gpio -v
python
sudo pip install wiringpi2
python
vim adc.py
python adc.py 
vim adc.py
python adc.py 
vim adc.py
python adc.py 
vim adc.py
python adc.py 
vim adc.py
nano adc.py
vim adc.py
sudo pip install pigpio
vim adc.py
python adc.py
vim adc.py
python adc.py
sudo pip install pigpio
pigs pigpv
pigs
sudo pigpiod
pigs
sudo pigpiod
rm pigpio.zip
wget abyz.me.uk/rpi/pigpio/pigpio.zip
unzip pigpio.zip 
ls
cd PIGPIO/
make
sudo make install
sudo pigpiod
vim adc.py
vim ../adc.py 
cd ..
python adc.py
whereis pigpio
whereis pigpiod
lsmod
sudo pigpiod
python adc.py
reboot
sudo reboot
ls

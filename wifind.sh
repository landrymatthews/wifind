#!/bin/bash

while true; do
	sleep 1
	RETX_COUNT=`sudo netstat -s | grep retransmitted | sudo awk '{print $1}'`
	echo "$RETX_COUNT" > "./retx_count.txt"
	PREV_RETX='0'
	RETX_DIFF=`expr $RETX_COUNT - $PREV_RETX`
	PREV_RETX=$RETX_COUNT
	echo $RETX_DIFF packets retransmitted since last check

	if [ $RETX_DIFF -gt -1 ]; then
		echo HIGH PACKET LOSS DETECTED
	
		# Getting spectrum data from drivers
		# NOTE: this cannot scan the spectrum
		# for *any* interference like our custom
		# sensor will be able to do. This only 
		# finds other 802.11 networks and returns
		# their SSID, power lvl, and channel.
		# Getting SSID, Signal power lvl and Frequency (channel). Each network is 3 lines.
		sudo iwlist wlan0 scan | grep -e ESSID -e level -e Frequency > iwscan_initial.txt
		# Removing any text preceding the signal level and channel data
		# Removing 5 GHz networks from the list and formatting for easy reading later
		sed -E 's/Quality=.* Signal level=-(.*) dBm/strength:\1/' iwscan_initial.txt | sed 's/Frequency.* GHz //' | sed -e '/Frequency/,+2d' | sed -E 's/\(Channel (.*)\)/channel:\1/' > iwscan.txt
		python plotSpec.py




		echo Now scanning spectrum...
		# SCAN SPECTRUM -> python specScan.py
			# This python script will save the data from the sensor 
			# into a file in this directory called spectrum.data. It
			# will also perform preliminary processing such as FFT 
			# and making a chart from the data
		SCAN_STATUS="$(python specScan.py)"
		sleep 2
		# Check for error
		if [ $SCAN_STATUS -eq -1 ]; then
			echo Error during spectrum scan. Aborting...
			exit -1
		# No errors
		else
			echo Spectrum data saved
		fi




		echo Checking for open channels...
		# CHANNEL SWITCHING ALGORITHM -> python analyzeData.py	
			# This python script will analyze the data saved 
			# by specScan.py and determine if there are any 
			# channels that would provide a better connection
		OPEN_CHANNEL="$(python analyzeData.py)" 
		sleep 2
		# If the script returned 0 then there were no open channels. 
		if [ $OPEN_CHANNEL -ne 0 ]; then
			echo The code determined that channel $OPEN_CHANNEL will provide a better connection
			echo Checking with other routers in network...
			sleep 2
			# ssh into other routers and get back a variable saying if they are occupying the channel
			#CHANNEL_IN_USE = true

			#if [ $CHANNEL_IN_USE == true ]; then
				#echo Channel in use by another router
			#fi
			

			echo Switching to channel $OPEN_CHANNEL
		else 
			echo No open channels were available. Will check again in 5 min
		fi	
	fi
done


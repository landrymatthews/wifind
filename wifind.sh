#!/bin/bash

COUNT=0
while true; do
	sleep 1
	RETX_COUNT=`sudo netstat -s | grep retransmitted | sudo awk '{print $1}'`
	echo "$RETX_COUNT" > "./retx_count.txt"
	PREV_RETX='0'
	RETX_DIFF=`expr $RETX_COUNT - $PREV_RETX`
	PREV_RETX=$RETX_COUNT
	#echo $RETX_DIFF packets retransmitted since last check
	if [ $RETX_DIFF -gt -1 ]; then
		echo PACKET LOSS DETECTED

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
		python plotSpec.py > plotSpecOutput.txt
		BEST_CHAN="$(tail -n 1 plotSpecOutput.txt)"
		echo The best channel was determined to be channel $BEST_CHAN

		# 42 is a random number we chose to trigger the acceptance test
		if [ "$1" -eq "42" ]; then
			echo "ACCEPTANCE TEST TRIGGERED. STARTING..."
			# acceptance test #
			# test 1 # - switch to bad channel, watch router find and switch to better channel. 
			if [ $COUNT -eq 0 ]; then
				echo "PERFORMING TEST 1 - WRONG CHANNEL"
				if [ $BEST_CHAN -eq 1 ]; then
					echo channel 1 is the best.
					echo To test the behavior we will switch to channel 6 instead and observe..
					sudo bash ./change_channel.sh 6
					COUNT=1
					continue
				fi

				if [ $BEST_CHAN -eq 6 ]; then
					echo channel 6 is the best.
					echo To test the behavior we will switch to channel 11 instead and observe..
					sudo bash ./change_channel.sh 11
					COUNT=1
					continue
				fi

				if [ $BEST_CHAN -eq 11 ]; then
					echo channel 11 is the best.
					echo To test the behavior we will switch to channel 1 instead and observe..
					sudo bash ./change_channel.sh 1
					COUNT=1
					continue
				fi
			fi

			# test 2 - unix time stamp for channel switching. find time network was down
			echo BEGINNING TEST 2 - HOP TIME
			time sudo bash ./change_channel.sh $BEST_CHAN
			echo Test 1 Complete.
			echo Channel hopping time can be seen above as the time after real.
			echo Test 2 Complete.
			sleep 3

			#test 3 - spec plot comparison- automatically push to github #
			echo "PERFORMING TEST 3 - CHART COMPARISON"
			echo "Pushing most recent spectrum chart to GitHub..."
			git add .
			git commit -m 'push from the script'
			git push
			sleep 2
			echo "Complete! Please refresh the page to see the new graph"
			echo "ALL TESTS COMPLETE. ACCEPTANCE TEST OVER"
			break

		fi
		sudo bash ./change_channel.sh $BEST_CHAN
	



		# echo Now scanning spectrum...
		# # SCAN SPECTRUM -> python specScan.py
		# 	# This python script will save the data from the sensor 
		# 	# into a file in this directory called spectrum.data. It
		# 	# will also perform preliminary processing such as FFT 
		# 	# and making a chart from the data
		# SCAN_STATUS="$(python specScan.py)"
		# sleep 2
		# # Check for error
		# if [ $SCAN_STATUS -eq -1 ]; then
		# 	echo Error during spectrum scan. Aborting...
		# 	exit -1
		# # No errors
		# else
		# 	echo Spectrum data saved
		# fi

		# echo Checking for open channels...
		# # CHANNEL SWITCHING ALGORITHM -> python analyzeData.py	
		# 	# This python script will analyze the data saved 
		# 	# by specScan.py and determine if there are any 
		# 	# channels that would provide a better connection
		# OPEN_CHANNEL="$(python analyzeData.py)" 
		# sleep 2
		# # If the script returned 0 then there were no open channels. 
		# if [ $OPEN_CHANNEL -ne 0 ]; then
		# 	echo The code determined that channel $OPEN_CHANNEL will provide a better connection
		# 	echo Checking with other routers in network...
		# 	sleep 2
		# 	# ssh into other routers and get back a variable saying if they are occupying the channel
		# 	#CHANNEL_IN_USE = true

		# 	#if [ $CHANNEL_IN_USE == true ]; then
		# 		#echo Channel in use by another router
		# 	#fi
		# 	

		# 	echo Switching to channel $OPEN_CHANNEL
		# else 
		# 	echo No open channels were available. Will check again in 5 min
		# fi	
	fi
	# sleep for 8 min 20 seconds
	sleep 500
done


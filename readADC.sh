#!/bin/bash
sudo pigpiod
sudo gpio -g mode 5 alt0
sudo python squarewave.py &
sudo python adc.py
sudo python adcPlot.py



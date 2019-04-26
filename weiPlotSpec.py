import time
import RPi.GPIO as GPIO
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
import math

channel = []
strength = []
ssid = []
with open("iwscan.txt", "r") as file:
    count = 0
    for line in file:
        if count % 3 == 0:
            # channel
            channel.append(line.split(":")[1].rstrip())
        elif count % 3 == 1:
            # strength
            strength.append(line.split(":")[1].rstrip())
        elif count % 3 == 2:
            # ssid
            ssid.append(line.split(":")[1].rstrip().strip('\"'))
        count+=1

channel = map(int, channel)
strength = map(int, strength)
def neg(n):
    return n*-1
strength = map(neg, strength)
dif = 0
for i in range(len(channel)):
    if channel[i-dif] > 14:
        del channel[i-dif]
        del strength[i-dif]
        del ssid[i-dif]
        dif+=1

print "channels: "
print channel
print "strengths: "
print strength
print "ssids: "
print ssid

plt.title('Spectrum Analysis')
plt.xlabel('WiFi Channel')
plt.ylabel('Signal Strength (dBm)')
plt.axis([1, 13, min(strength) - 10, max(strength) + 10]) # [xmin, xmax, ymin, ymax]
plt.grid(axis='y')
plt.xticks(range(1,13))
plt.plot(channel, strength, 'ro')



def calc_abc(x1, y1, x2, y2, x3, y3):
    x1,y1,x2,y2,x3,y3=float(x1),float(y1),float(x2),float(y2),float(x3),float(y3)
    denom = (x1-x2) * (x1-x3) * (x2-x3)
    a = (x3 * (y2-y1) + x2 * (y1-y3) + x1 * (y3-y2)) / denom
    b = (x3*x3 * (y1-y2) + x2*x2 * (y3-y1) + x1*x1 * (y2-y3)) / denom
    c = (x2 * x3 * (x2-x3) * y1+x3 * x1 * (x3-x1) * y2+x1 * x2 * (x1-x2) * y3) / denom
    print(str(a) + ", " + str(b) + ", " + str(c))
    return a, b, c


for i in range(len(channel)):
    plt.text(channel[i], strength[i], ssid[i] + ", " + str(strength[i]) + " dBm")
    x=np.linspace(channel[i]-2, channel[i]+2, 100)
    xaxis=min(strength) - 10
    a,b,c = calc_abc(channel[i]-2, xaxis, channel[i], strength[i], channel[i]+2, xaxis)
    y=(a*(x**2)) + (b*x) + c
    plt.plot(x,y)
plt.savefig('specplot.pdf', bbox_inches='tight')





sum1 = 0
sum6 = 0
sum11 = 0
for i in range(len(channel)):
    if channel[i] == 1:
        sum1 = sum1 + strength[i]
    if channel[i] == 6:
        sum6 = sum6 + strength[i]
    if channel[i] == 11:
        sum11 = sum11 + strength[i]

################## LED ####################
# order: green -> yellow -> orange -> red
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
redpin = 22
greenpin = 17
bluepin = 27
GPIO.setup(redpin,GPIO.OUT)
GPIO.setup(greenpin,GPIO.OUT)
GPIO.setup(bluepin,GPIO.OUT)

GPIO.output(redpin,GPIO.LOW)
GPIO.output(greenpin,GPIO.LOW)
GPIO.output(bluepin,GPIO.LOW)

if sum1 >= sum6 and sum1 >= sum11:
    print('channel 1 is the best')
    best_chan = 1
    GPIO.output(bluepin,GPIO.HIGH)
elif sum6 >= sum1 and sum6 >= sum11:
    print('channel 6 is the best')
    best_chan = 6
    GPIO.output(greenpin,GPIO.HIGH)
elif sum11 >= sum1 and sum11 >= sum6:
    print('channel 11 is the best')
    best_chan = 11
    GPIO.output(redpin,GPIO.HIGH)






min_str = max(sum1, sum6, sum11)
print("The software has the determined that the best channel to switch to is channel " + str(best_chan) + " based on it having the lowest signal peak of " + str(min_str) + "\n")
print(best_chan)

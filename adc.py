import RPi.GPIO as IO
import time
import numpy as np
import csv
#IO.setwarning(False)

b = np.zeros(8);
v = []
pin = [1,17,27,4,5,6,7,8]
clockpin = 9
IO.setmode(IO.BCM)

IO.setup(pin[0], IO.IN)
IO.setup(pin[1], IO.IN)
IO.setup(pin[2], IO.IN)
IO.setup(pin[3], IO.IN)
IO.setup(pin[4], IO.IN)
IO.setup(pin[5], IO.IN)
IO.setup(pin[6], IO.IN)
IO.setup(pin[7], IO.IN)

IO.setup(clockpin, IO.IN)
while len(v) < 100:
    if(IO.input(pin[7]) == True): b[7] = 1
    if(IO.input(pin[6]) == True): b[6] = 1
    if(IO.input(pin[6]) == True): b[5] = 1
    if(IO.input(pin[4]) == True): b[4] = 1
    if(IO.input(pin[3]) == True): b[3] = 1
    if(IO.input(pin[2]) == True): b[2] = 1
    if(IO.input(pin[1]) == True): b[1] = 1
    if(IO.input(pin[0]) == True): b[0] = 1
    x = 0
    for i in range(len(b)):
        x = x + (2**i)*(b[i])
    
    v.append(x)
    b = np.zeros(8)
    time.sleep(0.01)

np.savetxt('specValues.csv', (v), delimiter=',')

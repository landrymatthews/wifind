import RPi.GPIO as GPIO
import time
GPIO.setmode(GPIO.BCM)
GPIO.setup(18, GPIO.OUT)

# References for how to feed these functions parameters
#p = GPIO.PWM(channel, frequency)
#p.start(dc)   # where dc is the duty cycle (0.0 <= dc <= 100.0)
#p.ChangeFrequency(freq)   # where freq is the new frequency in Hz
#p.ChangeDutyCycle(dc)  # where 0.0 <= dc <= 100.0
#p.stop()

#Channel 1
p = GPIO.PWM(18, 5000)
p.start(29.3)   # where dc is the duty cycle (0.0 <= dc <= 100.0)
p.ChangeFrequency(5000)   # where freq is the new frequency in Hz
p.ChangeDutyCycle(11)  # where 0.0 <= dc <= 100.0
time.sleep(20)
p.stop()
print("channel 1 done")


#Channel 6
p = GPIO.PWM(18, 5000)
p.start(38)   # where dc is the duty cycle (0.0 <= dc <= 100.0)
p.ChangeFrequency(5000)   # where freq is the new frequency in Hz
p.ChangeDutyCycle(24.5)  # where 0.0 <= dc <= 100.0
time.sleep(20)
p.stop()
print("channel 6 done")


#Channel 11
p = GPIO.PWM(18, 5000)
p.start(54.6)   # where dc is the duty cycle (0.0 <= dc <= 100.0)
p.ChangeFrequency(5000)   # where freq is the new frequency in Hz
p.ChangeDutyCycle(49.5)  # where 0.0 <= dc <= 100.0
time.sleep(20)
p.stop()
print("channel 11 done")

import time
import pigpio

GPIO = 5
square = []

square.append(pigpio.pulse(1<<GPIO, 0, 400))
square.append(pigpio.pulse(0, 1<<GPIO, 400))

pi = pigpio.pi()

pi.set_mode(GPIO, pigpio.OUTPUT)
pi.wave_add_generic(square)
wid = pi.wave_create()

if wid >= 0:
    pi.wave_send_repeat(wid)
    time.sleep(60)
    pi.wave_tx_stop()
    pi.wave_delete(wid)

pi.stop()

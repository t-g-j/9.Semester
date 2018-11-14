import time
import serial

# configure the serial connections (the parameters differs on the device you are connecting to)
ser = serial.Serial('/dev/ttyUSB0', 3000000)
#    parity=serial.PARITY_ODD,
#    stopbits=serial.STOPBITS_TWO,
#    bytesize=serial.SEVENBITS
#)

ser.isOpen()

print 'Enter your commands below.\r\nInsert "exit" to leave the application.'

input=1
while 1 :
    # get keyboard input
    input = raw_input(">> ")
    if input == 'exit':
        ser.close()
        exit()
    else:
        ser.write(input + '\n')
        out = ''
        time.sleep(0.5)
        while ser.inWaiting() > 0:
            out += ser.read(1)

        if out != '':
            print ">>" + out

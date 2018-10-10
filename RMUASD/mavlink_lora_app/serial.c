/****************************************************************************
# Serial driver
# Copyright (c) 2004-2011 Kjeld Jensen <kjeld@cetus.dk>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
/****************************************************************************
# File: serial.c                                         
# Purpose: Serial driver
# Project: Serial driver 
# Platform: Linux/OSX
# Author: Kjeld Jensen <kjeld@cetus.dk>
# Note: You must have root priviledges to run these functions
# Created:  2004-07-06 Kjeld Jensen, 1.00
# Modified: 2004-08-09 Kjeld Jensen, 1.01, header changed
# Modified: 2004-08-11 Kjeld Jensen, 1.02, added support for USBSerial device under OSX
# Modified: 2005-02-05 Kjeld Jensen, 1.10, added serial_flush()
# Modified: 2005-07-23 Kjeld Jensen, 1.11, changed global.h to platform.h
# Modified: 2008-04-17 Kjeld Jensen, 1.20, added ser_linux_baudrate, changed prefix to serb, moved info from platform.h to serial.h
# Modified: 2010-03-11 Kjeld Jensen, 1.30, Added support for baudrates 460800-4000000, removed TARGET defines as init has been modified
# Modified: 2011-02-06 Kjeld Jensen, 1.31, Released under MIT license                                        
****************************************************************************/
/* system includes */
#include <time.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/signal.h>
#include <sys/types.h>
#include <stdio.h>

/***************************************************************************/
/* application includes */
#include "serial.h"

/***************************************************************************/
long ser_linux_baudrate (long baudRate)
{
	long linuxbaud;
	
	switch (baudRate)
	{
		case 1200: linuxbaud = B1200; break;
		case 2400: linuxbaud = B2400; break;
		case 4800: linuxbaud = B4800; break;
		case 9600: linuxbaud = B9600; break;
		case 19200: linuxbaud = B19200; break;
		case 38400: linuxbaud = B38400; break;
		case 57600: linuxbaud = B57600; break;
		case 115200: linuxbaud = B115200; break;
		case 230400: linuxbaud = B230400; break;	
		case 460800: linuxbaud = B460800; break;	
		case 500000: linuxbaud = B500000; break;	
		case 576000: linuxbaud = B576000; break;
		case 921600: linuxbaud = B921600; break;
		case 1000000: linuxbaud = B1000000; break;
		case 1500000: linuxbaud = B1500000; break;
		case 2000000: linuxbaud = B2000000; break;
		case 2500000: linuxbaud = B2500000; break;
		case 3000000: linuxbaud = B3000000; break;
		case 3500000: linuxbaud = B3500000; break;
		case 4000000: linuxbaud = B4000000; break;
	}
	return linuxbaud;
}
/***************************************************************************/
int ser_open (int *serRef, struct termios *oldtio, char *deviceName, long baudRate)
{
	int status = 0;
	struct termios newtio;

	/*open the device to be non-blocking*/
	*serRef = open(deviceName, O_RDWR | O_NOCTTY | O_NONBLOCK);

	if (*serRef >= 0)
	{
		/* save current port settings*/
		if (oldtio != NULL)
			tcgetattr(*serRef, oldtio); 

		/* set new port settings*/
        /* 
          BAUDRATE: Set bps rate. You could also use cfsetispeed and cfsetospeed.
          CRTSCTS : output hardware flow control (only used if the cable has
                    all necessary lines. See sect. 7 of Serial-HOWTO)
          CS8     : 8n1 (8bit,no parity,1 stopbit)
          CLOCAL  : local connection, no modem contol
          CREAD   : enable receiving characters
          CSTOPB  : stop bit
          PARENB  : parity bit
        */

		newtio.c_cflag = CS8 | CLOCAL | CREAD;
 
#ifdef MACOSX_USBSERIAL
		newtio.c_cflag = |= CSIZE; 
#endif		
		cfsetspeed(&newtio, baudRate); /* must be called after setting newtio.c_flag */

		newtio.c_iflag = IGNPAR;
		newtio.c_oflag = 0;
		newtio.c_lflag = 0;
		newtio.c_cc[VMIN]=0;  /* non-blocking read*/
		newtio.c_cc[VTIME]=0;
		ser_flush (*serRef);
		tcsetattr(*serRef,TCSANOW,&newtio);
	}	
	else
		status = 1;	

	return status;
}
/***************************************************************************/
#include <stdio.h>

int ser_send (int serRef, void *buffer, int numBytes)
{
	/*printf ("%d\n", crc); */
	int i;
	unsigned char *buf;
	buf = (unsigned char *) buffer;
	/*for (i=0; i<numBytes; i++)
	{
			printf ("%03d ", buf[i]);
	}
	printf ("\n");*/

	return write (serRef, buffer, numBytes);
}
/***************************************************************************/
int ser_receive (int serRef, void *buffer, int numBytes)
{
	return read(serRef, buffer, numBytes);
}
/***************************************************************************/
void ser_flush (int serRef)
{
	tcflush(serRef, TCIFLUSH);
}
/***************************************************************************/
void ser_close (int serRef, struct termios oldtio)
{
	/* restore old port settings */
	tcsetattr(serRef, TCSANOW, &oldtio);
	
	/* close the com port*/
	close(serRef);   
}
/***************************************************************************/

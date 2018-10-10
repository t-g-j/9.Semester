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
# File: serial.h                                        
# Purpose: Serial driver header file
# Project: Serial driver 
# Platform: Linux/OSX
# Author: Kjeld Jensen <kjeld@cetus.dk>
# Note: You must have root priviledges to run these functions
# Created:  2004-07-06 Kjeld Jensen, 1.00
# Modified: 2004-08-09 Kjeld Jensen, 1.01, header changed
# Modified: 2005-02-05 Kjeld Jensen, 1.10, added serial_flush()
# Modified: 2008-04-17 Kjeld Jensen, 1.20, added ser_linux_baudrate, changed prefix to serb, moved info from platform.h to serial.h
# Modified: 2010-03-11 Kjeld Jensen, 1.30, Added support for baudrates 460800-4000000, removed TARGET defines as init has been modified
# Modified: 2011-02-06 Kjeld Jensen, 1.31, Released under MIT license                                        
****************************************************************************/
/* system includes */
#include <stdlib.h>
#include <termios.h>

/***************************************************************************/
/* defines */

/* we need to define this if the GMUS-03 USB-serial adapter is used */
/* #define MACOSX_USBSERIAL */

/***************************************************************************/
/* function prototypes */

/* returns linux formattet baud rate */
long ser_linux_baudrate (long baudRate);

/* initializes the serial port, returns 0 if everything is ok */
int ser_open (
	int *serRef,			/* returned reference to the port */
	struct termios *oldtio,	/* placeholder for old port settings*/
	char *devName,			/* eg. "/dev/ttyS0" */ 
	long baudRate);
		
int ser_send (int serRef, void *buffer, int numBytes);

/* retrieves up to numBytes bytes from the serial port, returns the number
   of retrieved bytes, 0 if no bytes retrieved or -1 if an error occurs */
int ser_receive (int serRef, void *buffer, int numBytes);

/* flushes the input buffer */
void ser_flush (int serRef);

void ser_close (int serRef, struct termios oldtio);

/***************************************************************************/

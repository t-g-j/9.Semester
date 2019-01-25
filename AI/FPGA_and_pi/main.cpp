/**

Artificial skin project - TGJ & MALII

Description: 

Author: (Danish Sheik), Thor Gunnlaugsson Jensen & Magnus Liisberg
Email: danish@mmmi.sdu.dk, thorj14@student.sdu.dk, malii14@student.sdu.dk, 

Embodied AI and Neurorobotics Group
Centre for BioRobotics, Maersk Mc-Kinney Moeller Institute
University of Southern Denmark

**/

#define DELAY		200000
#define I2C_RESET	23

#include <cmath>
#include <stdio.h> // standard input / output functions
#include <string.h> // string function definitions
#include <unistd.h> // standard function definitions
#include <fcntl.h> // File control definitions
#include <errno.h> // Error number definitions
#include <termios.h> // terminal control definitions
#include <time.h>   // time calls
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/ioctl.h>
#include <stdlib.h>
#include <ncurses.h>
#include <sstream>
#include <linux/i2c-dev.h>
#include <signal.h>
#include <pigpio.h>
#include <math.h>

#define PMODAD2_I2C_ADDRESS 0x03
#define BYTES_PER_SAMPLE 2
#define SAMPLES_PER_CHANNEL 502 // Change this to read N bytes from the ADC
#define NCHANNELS 2
#define NBYTES (NCHANNELS*SAMPLES_PER_CHANNEL*BYTES_PER_SAMPLE)


using namespace std;

int i2c_handle;

FILE *fp;


int main(int argc, char** argv)
{

	char buf[5000] = {0}, run_filter = 0;
	double sine_L[SAMPLES_PER_CHANNEL-2] = {0}, sine_R[SAMPLES_PER_CHANNEL-2] = {0};
        int bytecnt, i, c, cnt;

        // Initialise pigpio library
        if (gpioInitialise() < 0)
        {
                //cout << "GPIO init failed." << endl;
		printf("GPIO init failed.\n");
                exit(1);
        }

        // Open I2C device
        i2c_handle = i2cOpen(1, PMODAD2_I2C_ADDRESS, 0);
        if (i2c_handle < 0)
        {
                //cout << "Cannot open I2C device." << endl;
		printf("Cannot open I2C device.\n");
                exit(1);
        }

	c = 0;
	cnt = 0;
	while(1)
	{
		int ch = getch();
		if (ch == 3)
                {
                	i2cClose(i2c_handle);
                	gpioTerminate();
                	system("stty sane");
                	exit(0);
                }

                gpioWrite(I2C_RESET,1); // Enable I2C transfer on the Logipi board
                usleep(20000);

                bytecnt = i2cReadDevice(i2c_handle, buf, NBYTES+1);

                usleep(9000);
                gpioWrite(I2C_RESET,0);
                usleep(1000);

                unsigned int l, r;

                if (bytecnt > 0)
                {
                        for (i = 2; i < SAMPLES_PER_CHANNEL; i+=1)
                        {
                                l = buf[i]<<4;
                                l += buf[i+SAMPLES_PER_CHANNEL*2]&0x0F;
                                r = buf[i+SAMPLES_PER_CHANNEL]<<4;
                                r += buf[i+SAMPLES_PER_CHANNEL*3]&0x0F;
				sine_L[i-2] = ((double)l-1700)/1000;
				sine_R[i-2] = ((double)r-1700)/1000;
                                printf("%u,%u\n",l,r);
                               // fprintf(fp,"%d,%d;\n",l,r);
                        }
                }
		else
		{
			printf("bytecnt = %d\n",bytecnt);
		}


	}; // end of while loop
	return 0;
}

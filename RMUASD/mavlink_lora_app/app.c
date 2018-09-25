/****************************************************************************
Project:		
File:				app.c
Purpose:		Scheduler application routines
Author:			Kjeld Jensen <kjeld@cetus.dk>

History:

date       name       version description 
---------- ---------- ------- -------------------------------------------
2009-03-16 Kjeld J.     1.0   software written

****************************************************************************/
/* includes */

#include <stdio.h>
#include <string.h>
#include <serial.h>
#include <sys/time.h>
#include "mavlink_lora_lib.h"
#include "app.h"
#include "monitor.h"
#include "mission_get.h"
#include "mission_set.h"
#include "param_get.h"
#include "param_set.h"
#include "param_list.h"

/***************************************************************************/
/* defines */

#define SER_BUF_SIZE 1000

#define CMD_NONE 0
#define CMD_MONITOR_ALL 1
#define CMD_MONITOR_FILTERED 2
#define CMD_MISSION_GET 3
#define CMD_MISSION_SET 4
#define CMD_PARAM_GET 5
#define CMD_PARAM_SET 6
#define CMD_PARAM_LIST 7
#define CMD_POSITION 8

unsigned long millis(void);

/***************************************************************************/
/* variables */

static char quit = 0;
static int ser = 0;
static struct termios oldtio;
static unsigned char serbuf[SER_BUF_SIZE];
static short serbuf_cnt;
static unsigned char cmd;

/***************************************************************************/
/* implementation of the arduino style millis() to return current number of
   milliseconds since application launch */
static unsigned long secs_init = 0;

unsigned long millis(void)
{
    struct timeval te; 
    gettimeofday(&te, NULL); /* get current time */

	if (secs_init == 0)
	{
		secs_init = te.tv_sec;
	}

	return ((unsigned long) (te.tv_sec - secs_init)*1000 + te.tv_usec/1000);
}
/***************************************************************************/
int app_init(int argc, char **argv)
{
	char ser_dev[50];
	int ser_err;
	char param_id[17];
	unsigned char ser_dev_set;
	int i;
	int status; 

	ser_dev_set = 0;
	status = APP_INIT_OK;
	cmd = CMD_NONE;
	param_id[0] = 0;

	strcpy (ser_dev, CFG_SER_DEV); /* default serial device */


	printf ("MavLink for Long Range links\n");
	printf ("v2018-03-19\n\n");

	/* parse command line options */
	for (i=1; i<argc; i++)
	{
		if (strchr(argv[i], '/'))
		{
			strcpy (ser_dev, argv[i]);	
			ser_dev_set = 1;	
		}
		else if (strstr(argv[i], "monitor"))
		{
			printf ("Command: Monitor all msgs\n");
			cmd = CMD_MONITOR_ALL;
		}
		else if (strstr(argv[i], "filter"))
		{
			printf ("Command: Monitor only low bandwidth filtered msgs\n");
			cmd = CMD_MONITOR_FILTERED;
		}
		else if (strstr(argv[i], "setmission"))
		{
			printf ("Command: Send new mission\n");
			cmd = CMD_MISSION_SET;
		}
		else if (strstr(argv[i], "getmission"))
		{
			printf ("Command: Get current mission\n");
			cmd = CMD_MISSION_GET;
		}
		else if (strstr(argv[i], "getparam"))
		{
			if (i+1 < argc)
			{
				printf ("Command: Get parameter value\n");
				strcpy (param_id, argv[i+1]);
				cmd = CMD_PARAM_GET;
			}
		}
		else if (strstr(argv[i], "setparam"))
		{
			printf ("Command: Set parameter value\n");
			cmd = CMD_PARAM_SET;
		}
		else if (strstr(argv[i], "paramlist"))
		{
			printf ("Command: Get list of parameters\n");
			cmd = CMD_PARAM_LIST;
		}
		else if (strstr(argv[i], "position"))
		{
			printf ("Command: Show current position\n");
			cmd = CMD_POSITION;
		}
	}

	if (cmd == CMD_NONE)
	{
		printf ("Usage\n");
		printf ("  mavlink_lora monitor [device]                             Monitor all msgs\n");
		printf ("  mavlink_lora filter [device]                              Monitor low bandwidth filtered msgs only\n");
		printf ("  mavlink_lora getmission [device]                          Get current mission\n");
		printf ("  mavlink_lora setmission [device]                          Set new mission\n");
		printf ("  mavlink_lora getparam <param_id> [device]                 Get parameter value\n");
		printf ("  mavlink_lora setparam <param_id> <param_value> [device]   Set parameter value\n");
		printf ("  mavlink_lora paramlist [device]                           Show list of parameters\n");
		printf ("  mavlink_lora position [device]                            Show and save current position\n\n");
		cmd = CMD_MONITOR_ALL;

		printf ("Command (default): Monitor all msgs\n");
	}
	
	if (ser_dev_set == 0)
		printf ("Serial device (default): %s\n\n", ser_dev);
	else
		printf ("Serial device: %s\n\n", ser_dev);

	/* try to open the serial device */
	ser_err = ser_open (&ser, &oldtio, ser_dev, CFG_SER_BAUD);
	
	/* if everything ok */
	if (! ser_err)
	{
		ml_init();

		/* command */
		switch (cmd)
		{
			case CMD_MONITOR_ALL:
				mon_init();
				ml_set_monitor_all();
				break;
			case CMD_MONITOR_FILTERED:
				mon_init();
				break;
			case CMD_MISSION_GET:
				ml_set_monitor_all();
				mission_get_init();
				break;
			case CMD_MISSION_SET:
				mission_set_init();
				break;
			case CMD_PARAM_GET:
				param_get_init(param_id);
				break;
			case CMD_PARAM_SET:
				param_set_init();
				break;
			case CMD_PARAM_LIST:
				param_list_init();
				break;
			case CMD_POSITION:
				pos_init();
				ml_set_monitor_all();
				break;
		}
	}
	else
	{
		status = APP_INIT_ERR;
		printf ("Unable to open serial device\n");
	}

	return status;
}
/***************************************************************************/
short ml_tx_update (void)
{
		/* printf ("sending %d\n", txbuf_cnt); */
	/* int i;

	for (i=0; i<txbuf_cnt; i++)
	{
			printf ("%03d ", txbuf[i]);
	}
	printf ("\n"); */


		ser_send (ser, txbuf, txbuf_cnt);
		txbuf_cnt = 0;
}
/***************************************************************************/
void ml_parse_msg(unsigned char *msg)
{
	switch (cmd)
	{
		case CMD_MONITOR_ALL:
		case CMD_MONITOR_FILTERED:
			mon_parse_msg(msg, millis());
			break;
		case CMD_MISSION_GET:
			mission_get_parse_msg(msg, millis());
			break;
		case CMD_MISSION_SET:
			mission_set_parse_msg(msg, millis());
			break;
		case CMD_PARAM_GET:
			param_get_parse_msg(msg, millis());
			break;
		case CMD_PARAM_SET:
			param_set_parse_msg(msg, millis());
			break;
		case CMD_PARAM_LIST:
			param_list_parse_msg(msg, millis());
			break;
		case CMD_POSITION:
			pos_parse_msg(msg, millis());
			break;
	}
}
/***************************************************************************/
int app_update(void)
{
	char result;
	unsigned long now = millis();
	serbuf_cnt = SER_BUF_SIZE;
	serbuf_cnt = ser_receive (ser, serbuf, serbuf_cnt);
	
	/* if we received new data */
	if (serbuf_cnt > 0)
	{
		result = ml_rx_update(now, serbuf, serbuf_cnt);
		if (result > 0)
		{
			short i, pos;
			pos = 0;
			for (i=0; i < result; i++)
			{
				while (rxbuf_filtered[pos] != ML_NEW_PACKET_IDENT_V10)
					pos++;
				pos++;
			}
			rxbuf_filtered_cnt = 0;
		}
	}
	 
	/* command */
	switch (cmd)
	{
		case CMD_MONITOR_ALL:
		case CMD_MONITOR_FILTERED:
			mon_update();
			break;
		case CMD_MISSION_GET:
			quit = mission_get_update(now);
			break;
		case CMD_MISSION_SET:
			mission_set_update();
			break;
		case CMD_PARAM_GET:
			quit = param_get_update();
			break;
		case CMD_PARAM_SET:
			param_set_update();
			break;
		case CMD_PARAM_LIST:
			param_list_update();
			break;
		case CMD_POSITION:
			pos_update();
			break;
	}
	return quit;
}
/***************************************************************************/
void app_quit(void)
{
	if (ser != 0)
	{
		ser_close (ser, oldtio);
	}
}
/***************************************************************************/


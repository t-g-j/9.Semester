/***************************************************************************
# MavLink LoRa App
# Copyright (c) 2017, Kjeld Jensen <kjen@mmmi.sdu.dk> <kj@kjen.dk>
# SDU UAS Center, http://sdu.dk/uas 
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#    * Redistributions of source code must retain the above copyright
#      notice, this list of conditions and the following disclaimer.
#    * Redistributions in binary form must reproduce the above copyright
#      notice, this list of conditions and the following disclaimer in the
#      documentation and/or other materials provided with the distribution.
#    * Neither the name of the copyright holder nor the names of its
#      contributors may be used to endorse or promote products derived from
#      this software without specific prior written permission.
#
# This library is based on the output from the MavLink generator
# http://www.mavlink.org which is released under the MIT license:
# https://opensource.org/licenses/MIT
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#****************************************************************************
Revision
2017-12-02 KJ First released test version
****************************************************************************/

/* http://qgroundcontrol.org/mavlink/waypoint_protocol */

/* includes */
#include <stdio.h>
#include <string.h>
#include "mavlink_lora_lib.h"

/***************************************************************************/
/* defines */

#define MREQ_STATE_IDLE 0
#define MREQ_STATE_WAIT_MISSION_COUNT 1
#define MREQ_STATE_REQUEST_ITEM 2
#define MREQ_STATE_WAIT_ITEM 3
#define MREQ_STATE_QUIT 10

#define WAIT_TIME 4000 /* [ms] */

#define MISSION_COUNT_MAX 50

/***************************************************************************/
/* static variables */

static unsigned char quit;
static unsigned char first_msg_received;
static unsigned char mreq_state;
static unsigned short mission_count;
static unsigned short request_next;
static unsigned char request_try;
static unsigned long wait_tout;
static char file_name[20];

/***************************************************************************/
/* function prototypes */
void mission_get_create_new_file(void);

/***************************************************************************/
void mission_get_init(void)
{
	quit = 0;
	first_msg_received = 0;
	mreq_state = MREQ_STATE_IDLE;
	mission_count = 0;
	request_next = 0;
	request_try = 0;
	strcpy (file_name, "mission.txt");
	mission_get_create_new_file();
	ml_set_monitor_all(); 
}
/***************************************************************************/
void mission_get_create_new_file(void)
{
	FILE *fp;
	fp = fopen(file_name, "w");
	fclose (fp);
}
/***************************************************************************/
void mission_get_append_to_file(mavlink_mission_item_t item)
{
	unsigned short i;	
	FILE *fp;
	fp = fopen(file_name, "a");
	
	fprintf (fp, "%.3f %.3f %.3f %.3f", item.param1, item.param2, item.param3, item.param4);
	fprintf (fp, " %.6f %.6f %.1f", item.x, item.y, item.z);
	fprintf (fp, " %d %d %d %d %d %d %d\n", item.seq, item.command, item.target_system, item.target_component, item.frame, item.current, item.autocontinue);
	fclose (fp);
}
/***************************************************************************/
void mission_request_list(unsigned long now)
{
	if (request_try < 4)
	{
		request_try++;
		ml_queue_msg_mission_request_list();
		ml_tx_update();
		wait_tout = now + WAIT_TIME;
		mreq_state = MREQ_STATE_WAIT_MISSION_COUNT;
	}
	else
	{
		mreq_state = MREQ_STATE_QUIT;
	}	
}
/***************************************************************************/
void mission_request_next_item(unsigned long now)
{
	if (request_try < 4)
	{
		request_try++;
		ml_queue_msg_mission_request (request_next);
		ml_tx_update();
		wait_tout = now + WAIT_TIME;
		mreq_state = MREQ_STATE_WAIT_ITEM;
	}
	else
	{
		mreq_state = MREQ_STATE_QUIT;
	}	
}
/***************************************************************************/
void mission_ack()
{
	ml_queue_msg_mission_ack ();
	ml_tx_update();
}
/***************************************************************************/
void mission_get_parse_msg(unsigned char *msg, unsigned long now)
{
	/* printf ("%.3f MSG %03d ", (double) (now)/1000, msg[ML_POS_MSG_ID]); */

	switch (msg[ML_POS_MSG_ID])
	{
		case MAVLINK_MSG_ID_HEARTBEAT:
			first_msg_received = 1;
			break;
			
		case MAVLINK_MSG_ID_MISSION_ITEM:
			if (mreq_state == MREQ_STATE_WAIT_ITEM)
			{
				mavlink_mission_item_t item = ml_unpack_msg_mission_item (msg + ML_POS_PAYLOAD);
				if (item.seq == request_next)
				{				
					mission_get_append_to_file (item);
					printf ("MISSION_ITEM %d\n", item.seq);
					printf ("  %.6f %.6f %.1f\n", item.x, item.y, item.z);
					request_next++;
					request_try = 0;
					if (request_next == mission_count)
					{
						printf ("all good\n");
						mission_ack();
						mreq_state = MREQ_STATE_QUIT;
					}
					else
						mreq_state = MREQ_STATE_REQUEST_ITEM;
				}
				else if (item.seq == request_next - 1)
				{
						mreq_state = MREQ_STATE_REQUEST_ITEM;


				}
				else
				{
					printf ("MISSION_ITEM (err seq) %d\n", item.seq);
				}
			}
			else
			{
				printf ("This shouldn't happen: mreq_state = %d\n", mreq_state);
			}
			break;
		case MAVLINK_MSG_ID_MISSION_COUNT:
			if (mreq_state == MREQ_STATE_WAIT_MISSION_COUNT)
			{
				mission_count = ml_unpack_msg_mission_count (msg + ML_POS_PAYLOAD);
				printf ("MISSION_COUNT: %d\n", mission_count);
				if (mission_count == 0)
				{
					printf ("No mission available\n");
					mreq_state = MREQ_STATE_QUIT;
				}
				else
				{	
					request_next = 0;
					request_try = 0; 
					mreq_state = MREQ_STATE_REQUEST_ITEM;
				}
			}
			break;
	}
}
/***************************************************************************/
unsigned short mission_get_update(unsigned long now)
{
	switch (mreq_state)
	{
		case MREQ_STATE_IDLE:
			if (first_msg_received == 1)
			{
				printf ("Requesting mission\n");
				mreq_state = MREQ_STATE_WAIT_MISSION_COUNT;
				mission_request_list(now);
			}
			break;

		case MREQ_STATE_WAIT_MISSION_COUNT:
			if (now > wait_tout)
			{
				printf ("Timeout!\n");
				mreq_state = MREQ_STATE_IDLE;
			}
			break;
			
		case MREQ_STATE_REQUEST_ITEM:
			printf ("Requesting item %d\n", request_next);
			mission_request_next_item(now);	
			break;

		case MREQ_STATE_WAIT_ITEM:
			if (now > wait_tout)
			{
				printf ("Timeout!\n");
				mreq_state = MREQ_STATE_REQUEST_ITEM;
			}
			break;
	}

	if (mreq_state == MREQ_STATE_QUIT)
		quit = 1;

	return quit;
}
/***************************************************************************/


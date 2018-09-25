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

/***************************************************************************/
/* static variables */

static unsigned char first_msg_received;
static unsigned char req_sent;
static char param_id_static[17];
static unsigned char quit;

/***************************************************************************/
void param_get_init(char *param_id)
{
	quit = 0;
	first_msg_received = 0;
	req_sent = 0;
	memcpy (param_id_static, param_id, 16);
	/* ml_set_monitor_all(); */
}
/***************************************************************************/
void param_get_parse_msg(unsigned char *msg, unsigned long now)
{
	first_msg_received = 1;
	/* printf ("%.3f MSG %03d \n", (double) (now)/1000, msg[ML_POS_MSG_ID]); */

	switch (msg[ML_POS_MSG_ID])
	{
		case MAVLINK_MSG_ID_PARAM_VALUE:
			{
				float param_value;
				unsigned char *fp;
				char param_id[17];
				unsigned char param_type;
				param_type = msg[ML_POS_PAYLOAD + 24];

				switch (param_type)
				{
					case 9: /* 32-bit floating-point */
					{
						fp = (unsigned char *) &param_value;
						fp[0] = msg[ML_POS_PAYLOAD + 0];
						fp[1] = msg[ML_POS_PAYLOAD + 1];
						fp[2] = msg[ML_POS_PAYLOAD + 2];
						fp[3] = msg[ML_POS_PAYLOAD + 3];					
					}
					break;
				}
				memcpy (param_id, &msg[ML_POS_PAYLOAD + 8], 16);
				param_id[16] = 0; 
				
				printf ("PARAM_ID: %s TYPE: %d VALUE: %.3f\n", param_id, param_type, param_value);
				quit = 1;
			}
			break;
	}
}
/***************************************************************************/
unsigned char param_get_update(void)
{

	if (first_msg_received && ! req_sent)
	{
		short i;
		req_sent = 1;

		printf ("Requesting parameter value: %s\n", param_id_static);
		ml_queue_msg_param_request_read(param_id_static);
		ml_tx_update();
	}
	return quit;
}
/***************************************************************************/


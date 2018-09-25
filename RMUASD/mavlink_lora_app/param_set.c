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
/* includes */
#include <stdio.h>
#include <string.h>
#include "mavlink_lora_lib.h"

/***************************************************************************/
/* defines */

/***************************************************************************/
/* static variables */

char first_msg_received;
char req_sent;

/***************************************************************************/
void param_set_init(void)
{
	first_msg_received = 0;
	req_sent = 0;
}
/***************************************************************************/
void param_set_parse_msg(unsigned char *msg, unsigned long now)
{
	first_msg_received = 1;
	printf ("%.3f MSG %03d ", (double) (now)/1000, msg[ML_POS_MSG_ID]);

	switch (msg[ML_POS_MSG_ID])
	{
		case 39:
			printf ("MISSION_ITEM                      YESSIR");
			break;
	}

	printf ("\n");
}
/***************************************************************************/
void param_set_update(void)
{

	if (first_msg_received && ! req_sent)
	{
		short i;

		req_sent = 1;

		/*ml_queue_msg_param_set_request_read("BAT_LOW_THR");
		ml_queue_msg_param_set_request_read("CAL_GYRO2_XSCALE");
		ml_queue_msg_param_set_request_read("MPC_XY_VEL_MAX");
		ml_queue_msg_param_set_set("MPC_XY_VEL_MAX", 10);
		ml_queue_msg_param_set_request_read("MPC_XY_CRUISE");
		ml_queue_msg_param_set_set("MPC_XY_CRUISE", 7);
		printf ("requesting                     now\n");
		ml_queue_msg_mission_request_list();
		ml_tx_update();
		ml_queue_msg_mission_request_partial_list (2);
		txbuf_cnt = 0; */
	}

}
/***************************************************************************/
void param_set_quit(void)
{
}
/***************************************************************************/


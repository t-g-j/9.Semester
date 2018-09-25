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

/***************************************************************************/
void mon_init(void)
{

}
/***************************************************************************/
void mon_parse_msg(unsigned char *msg, unsigned long now)
{
	printf ("%.3f MSG %03d ", (double) (now)/1000, msg[ML_POS_MSG_ID]);

	switch (msg[ML_POS_MSG_ID])
	{
		case 0:
			printf ("HEARTBEAT");
			break;
		case 1:
			{
				mavlink_sys_status_t sys_status = ml_unpack_msg_sys_status (msg + ML_POS_PAYLOAD);
				printf ("SYS_STATUS: Voltage %d mV", sys_status.voltage_battery);
			}
			break;
		case 2:
			printf ("SYSTEM_TIME");
			break;
		case MAVLINK_MSG_ID_PARAM_REQUEST_READ: /* id=20 */
			printf ("PARAM_REQUEST_READ");
			break;
		case MAVLINK_MSG_ID_PARAM_VALUE: /* id=22 */
			{
				float param_value;
				unsigned char *fp;
				char param_id[17];
				unsigned char param_type;
				param_type = msg[ML_POS_PAYLOAD + 24];

				switch (param_type)
				{
					case 9:
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
				
				printf ("PARAM_ID %s TYPE %d VALUE %.6f", param_id, param_type, param_value);
			}
			break;
		case 24:
			{
				char s[80];
				mavlink_gps_raw_int_t gri = ml_unpack_msg_gps_raw_int (msg + ML_POS_PAYLOAD);
				sprintf (s, "%.3f,%.7f,%.7f,%.3f\n", (double) gri.time_usec/1000000, (double) gri.lat/10000000, (double) gri.lon/10000000, (double) gri.alt/1000);			


				printf ("GPS_RAW_INT: %s", s);
			}			
			break;


			break;
		case 27:
			printf ("RAW_IMU");
			break;
		case 29:
			printf ("SCALED_PRESSURE");
			break;
		case 30:
			printf ("ATTITUDE");
			break;
		case 31:
			printf ("ATTITUDE_QUATERNION");
			break;
		case 32:
			printf ("LOCAL_POSITION_NED");
			break;
		case 33:
			{
				char s[80];
				mavlink_global_position_int_t gpi = ml_unpack_msg_global_position_int (msg + ML_POS_PAYLOAD);
				sprintf (s, "time_boot %.3f lat %.7f lon %.7f alt %.3fm", (double) gpi.time_boot_ms/1000, (double) gpi.lat/10000000, (double) gpi.lon/10000000, (double) gpi.alt/1000);			
				printf ("GLOBAL_POSITION_INT: %s", s);
			}
			break;
		case 35:
			printf ("RC_CHANNELS_RAW");
			break;
		case 36:
			printf ("SERVO_OUTPUT_RAW");
			break;
		case 39:
			printf ("MISSION_ITEM");
			break;
		case 42:
			{
				uint16_t current = ml_unpack_msg_mission_current (msg + ML_POS_PAYLOAD);
				printf ("MISSION_CURRENT: %d", current);
			}
			break;
		case 62:
			printf ("NAV_CONTROLLER_OUTPUT");
			break;
		case 65:
			printf ("RC_CHANNELS");
			break;
		case 74:
			printf ("VFR_HUD");
			break;
		case 105:
			printf ("HIGHRES_IMU");
			break;
		case 109:
			printf ("RADIO_STATUS");
			break;
		case 116:
			printf ("SCALED_IMU2");
			break;
		case 125:
			printf ("POWER STATUS");
			break;
		case 129:
			printf ("SCALED_IMU3");
			break;
		case 133:
			printf ("TERRAIN_REQUEST");
			break;
		case 136:
			printf ("TERRAIN_REPORT");
			break;
		case 141:
			printf ("ALTITUDE");
			break;
		case 137:
			printf ("SCALED_PRESSURE2");
			break;
		case 147:
			{
				battery_status_t batt = ml_unpack_msg_battery_status(msg + ML_POS_PAYLOAD);
				printf ("BATTERY_STATUS: Voltage %.1fV Remaining: %d%%", ((double) (batt.voltage)/1000), batt.battery_remaining);
			}
			break;
		case 230:
			printf ("ESTIMATOR_STATUS");
			break;
		case 231:
			printf ("WIND_COV");
			break;
		case 241:
			printf ("VIBRATION");
			break;
		case 245:
			printf ("EXTENDED_SYS_STATE"); /* includes landed_state */
			break;
		case 253:
			printf ("STATUSTEXT");
			break;
	}

	printf ("\n");
}
/***************************************************************************/
void mon_update(void)
{
}
/***************************************************************************/
void mon_quit(void)
{
}
/***************************************************************************/


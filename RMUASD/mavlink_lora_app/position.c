/***************************************************************************
# MavLink LoRa App
# Copyright (c) 2017-2018, Kjeld Jensen <kjen@mmmi.sdu.dk> <kj@kjen.dk>
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
2018-03-18 KJ First released test version
****************************************************************************/
/* includes */
#include <stdio.h>
#include <string.h>
#include "mavlink_lora_lib.h"

/***************************************************************************/
/* defines */

/***************************************************************************/
/* static variables */
FILE *f;
char s[80];

/***************************************************************************/
void pos_init(void)
{
	f = fopen("position.log", "a");
	fprintf (f, "#time_boot,lat,lon,alt,relative_alt,vx,vy,vz,heading\n");
}
/***************************************************************************/
void pos_parse_msg(unsigned char *msg, unsigned long now)
{
	switch (msg[ML_POS_MSG_ID])
	{
		case 24:
			{
				mavlink_gps_raw_int_t gri = ml_unpack_msg_gps_raw_int (msg + ML_POS_PAYLOAD);
				sprintf (s, "%.3f,%.7f,%.7f,%.3f\n", (double) gri.time_usec/1000000, (double) gri.lat/10000000, (double) gri.lon/10000000, (double) gri.alt/1000);			


				printf ("GPS_RAW_INT ");
				printf ("%s", s);			

				fprintf (f, "%s", s);
			}			
			break;

		case 33:
			{
				mavlink_global_position_int_t gpi = ml_unpack_msg_global_position_int (msg + ML_POS_PAYLOAD);
				sprintf (s, "%.3f,%.7f,%.7f,%.3f,%.3f,%.2f,%.2f,%.2f,%.2f\n", (double) gpi.time_boot_ms/1000, (double) gpi.lat/10000000, (double) gpi.lon/10000000, (double) gpi.alt/1000, (double) gpi.relative_alt/1000, (double) gpi.vx/100, (double) gpi.vy/100, (double) gpi.vz/100, (double) gpi.hdg/100);			

				printf ("GLOBAL_POSITION_INT ");
				printf ("%s", s);			

				fprintf (f, "%s", s);
			}			
			break;
	}
}
/***************************************************************************/
void pos_update(void)
{
}
/***************************************************************************/
void pos_quit(void)
{
	fclose(f);
}
/***************************************************************************/


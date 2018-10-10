/***************************************************************************
# MavLink LoRa library
# MavLink long range communication library 
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
2017-11-27 KJ First released test version
2018-03-18 KJ Added unpacking of global_position_int and mission_current
****************************************************************************/

#ifndef KJMAVLINK_H
#define KJMAVLINK_H

/***************************************************************************/
/* parameters */

#define MSG_ID_MIN_INTERVAL 3000 /* [ms] min interval between msgs of same id */
#define MSG_SEQ_MIN_INTERVAL 0 /* [ms] min interval between msgs of any id */

/* #define DROP_MSGS_WITH_ID {30, 32, 35, 36, 62, 109} */ /* AutoQuad long range default */

#define DROP_MSGS_WITH_ID {2, 24, 27, 29, 30, 31, 32, 35, 36, 62, 65, 74, 105, 116, 125, 129, 133, 136, 137, 147, 230, 231, 241, 245} /* PX4 long range default */


/***************************************************************************/
/* defines */

/* serial stream buffers */
#define RX_BUF_SIZE	750
#define TX_BUF_SIZE	250

/* mavlink message content */
#define ML_NEW_PACKET_IDENT_V10	0xfe /* MavLink v1.0 */
#define ML_NEW_PACKET_IDENT_V20	0xfd /* MavLink v2.0 */

/* mavlink system id */
#define MAV_SYS_ID_ALL 0
#define MAV_SYS_ID_UA 1
#define MAV_SYS_ID_GCS 255

/* mavlink component id */
/*#define MAV_COMP_ID_ALL 0 */

/* mavlink message format */
#define ML_POS_IDENT 0
#define ML_POS_PAYLOAD_LEN 1
#define ML_POS_PACKET_SEQ 2
#define ML_POS_SYS_ID 3
#define ML_POS_COMP_ID 4
#define ML_POS_MSG_ID 5
#define ML_POS_PAYLOAD 6

/* mavlink message id's /*
/* needed because we are not including the official mavlink headers */

#define MAVLINK_MSG_ID_HEARTBEAT 0

#define MAVLINK_MSG_ID_PARAM_REQUEST_READ 20
#define MAVLINK_MSG_ID_PARAM_REQUEST_READ_LEN 20

#define MAVLINK_MSG_ID_PARAM_REQUEST_LIST 21
#define MAVLINK_MSG_ID_PARAM_REQUEST_LIST_LEN 2

#define MAVLINK_MSG_ID_PARAM_VALUE 22
#define MAVLINK_MSG_ID_PARAM_VALUE_LEN 25

#define MAVLINK_MSG_ID_PARAM_SET 23
#define MAVLINK_MSG_ID_PARAM_SET_LEN 23

#define MAVLINK_MSG_ID_GPS_RAW_INT 24
#define MAVLINK_MSG_ID_GPS_RAW_INT_LEN 30

#define MAVLINK_MSG_ID_GLOBAL_POSITION_INT 33
#define MAVLINK_MSG_ID_GLOBAL_POSITION_INT_LEN 28

#define MAVLINK_MSG_ID_MISSION_REQUEST_PARTIAL_LIST 37
#define MAVLINK_MSG_ID_MISSION_REQUEST_PARTIAL_LIST_LEN 6

#define MAVLINK_MSG_ID_MISSION_ITEM 39

#define MAVLINK_MSG_ID_MISSION_REQUEST 40
#define MAVLINK_MSG_ID_MISSION_REQUEST_LEN 4

#define MAVLINK_MSG_ID_MISSION_CURRENT 42
#define MAVLINK_MSG_ID_MISSION_CURRENT_LEN 2

#define MAVLINK_MSG_ID_MISSION_REQUEST_LIST 43
#define MAVLINK_MSG_ID_MISSION_REQUEST_LIST_LEN 2

#define MAVLINK_MSG_ID_MISSION_COUNT 44

#define MAVLINK_MSG_ID_MISSION_ACK 47
#define MAVLINK_MSG_ID_MISSION_ACK_LEN 3

typedef struct battery_status_t {
	unsigned short voltage; /* [mV] */
	char battery_remaining; /* [0;100] [%], -1 means invalid data */
} battery_status_t;

#include <stdint.h>

/* typedef char int8_t; */
typedef unsigned char uint8_t;
typedef short int16_t;
typedef unsigned short uint16_t;
typedef int int32_t;
typedef unsigned int uint32_t;
/* typedef unsigned long long int uint64_t; */

typedef struct __mavlink_gps_raw_int_t {
 uint64_t time_usec; /*< Timestamp (microseconds since UNIX epoch or microseconds since system boot)*/
 int32_t lat; /*< Latitude (WGS84, EGM96 ellipsoid), in degrees * 1E7*/
 int32_t lon; /*< Longitude (WGS84, EGM96 ellipsoid), in degrees * 1E7*/
 int32_t alt; /*< Altitude (AMSL, NOT WGS84), in meters * 1000 (positive for up). Note that virtually all GPS modules provide the AMSL altitude in addition to the WGS84 altitude.*/
 uint16_t eph; /*< GPS HDOP horizontal dilution of position (unitless). If unknown, set to: UINT16_MAX*/
 uint16_t epv; /*< GPS VDOP vertical dilution of position (unitless). If unknown, set to: UINT16_MAX*/
 uint16_t vel; /*< GPS ground speed (m/s * 100). If unknown, set to: UINT16_MAX*/
 uint16_t cog; /*< Course over ground (NOT heading, but direction of movement) in degrees * 100, 0.0..359.99 degrees. If unknown, set to: UINT16_MAX*/
 uint8_t fix_type; /*< See the GPS_FIX_TYPE enum.*/
 uint8_t satellites_visible; /*< Number of satellites visible. If unknown, set to 255*/
} mavlink_gps_raw_int_t;


typedef struct __mavlink_sys_status_t {
 uint32_t onboard_control_sensors_present; /*< Bitmask showing which onboard controllers and sensors are present. Value of 0: not present. Value of 1: present. Indices defined by ENUM MAV_SYS_STATUS_SENSOR*/
 uint32_t onboard_control_sensors_enabled; /*< Bitmask showing which onboard controllers and sensors are enabled:  Value of 0: not enabled. Value of 1: enabled. Indices defined by ENUM MAV_SYS_STATUS_SENSOR*/
 uint32_t onboard_control_sensors_health; /*< Bitmask showing which onboard controllers and sensors are operational or have an error:  Value of 0: not enabled. Value of 1: enabled. Indices defined by ENUM MAV_SYS_STATUS_SENSOR*/
 uint16_t load; /*< Maximum usage in percent of the mainloop time, (0%: 0, 100%: 1000) should be always below 1000*/
 uint16_t voltage_battery; /*< Battery voltage, in millivolts (1 = 1 millivolt)*/
 int16_t current_battery; /*< Battery current, in 10*milliamperes (1 = 10 milliampere), -1: autopilot does not measure the current*/
 uint16_t drop_rate_comm; /*< Communication drops in percent, (0%: 0, 100%: 10'000), (UART, I2C, SPI, CAN), dropped packets on all links (packets that were corrupted on reception on the MAV)*/
 uint16_t errors_comm; /*< Communication errors (UART, I2C, SPI, CAN), dropped packets on all links (packets that were corrupted on reception on the MAV)*/
 uint16_t errors_count1; /*< Autopilot-specific errors*/
 uint16_t errors_count2; /*< Autopilot-specific errors*/
 uint16_t errors_count3; /*< Autopilot-specific errors*/
 uint16_t errors_count4; /*< Autopilot-specific errors*/
 int8_t battery_remaining; /*< Remaining battery energy: (0%: 0, 100%: 100), -1: autopilot estimate the remaining battery*/
} mavlink_sys_status_t;

typedef struct __mavlink_global_position_int_t {
 uint32_t time_boot_ms; /*< Timestamp (milliseconds since system boot)*/
 int32_t lat; /*< Latitude, expressed as degrees * 1E7*/
 int32_t lon; /*< Longitude, expressed as degrees * 1E7*/
 int32_t alt; /*< Altitude in meters, expressed as * 1000 (millimeters), AMSL (not WGS84 - note that virtually all GPS modules provide the AMSL as well)*/
 int32_t relative_alt; /*< Altitude above ground in meters, expressed as * 1000 (millimeters)*/
 int16_t vx; /*< Ground X Speed (Latitude, positive north), expressed as m/s * 100*/
 int16_t vy; /*< Ground Y Speed (Longitude, positive east), expressed as m/s * 100*/
 int16_t vz; /*< Ground Z Speed (Altitude, positive down), expressed as m/s * 100*/
 uint16_t hdg; /*< Vehicle heading (yaw angle) in degrees * 100, 0.0..359.99 degrees. If unknown, set to: UINT16_MAX*/
} mavlink_global_position_int_t;

typedef struct __mavlink_mission_item_t { /* mavlink/common/mavlink_msg_mission_item.h */
 float param1; /*< PARAM1, see MAV_CMD enum*/
 float param2; /*< PARAM2, see MAV_CMD enum*/
 float param3; /*< PARAM3, see MAV_CMD enum*/
 float param4; /*< PARAM4, see MAV_CMD enum*/
 float x; /*< PARAM5 / local: x position, global: latitude*/
 float y; /*< PARAM6 / y position: global: longitude*/
 float z; /*< PARAM7 / z position: global: altitude (relative or absolute, depending on frame.*/
 uint16_t seq; /*< Sequence*/
 uint16_t command; /*< The scheduled action for the waypoint. see MAV_CMD in common.xml MAVLink specs*/
 uint8_t target_system; /*< System ID*/
 uint8_t target_component; /*< Component ID*/
 uint8_t frame; /*< The coordinate system of the waypoint. see MAV_FRAME in mavlink_types.h*/
 uint8_t current; /*< false:0, true:1*/
 uint8_t autocontinue; /*< autocontinue to next wp*/
} mavlink_mission_item_t;

/***************************************************************************/
/* global variables */

extern unsigned char txbuf[TX_BUF_SIZE];
extern unsigned char rxbuf_filtered[RX_BUF_SIZE];
extern short txbuf_cnt;
extern short rxbuf_filtered_cnt;

/***************************************************************************/
/* function prototypes */

void ml_init(void);
void ml_set_monitor_all(void);
short ml_rx_update(unsigned long ms, unsigned char *buf, short buf_cnt);
mavlink_sys_status_t ml_unpack_msg_sys_status (unsigned char *payload);
battery_status_t ml_unpack_msg_battery_status (unsigned char *payload);
mavlink_gps_raw_int_t ml_unpack_msg_gps_raw_int (unsigned char *payload);
mavlink_global_position_int_t ml_unpack_msg_global_position_int (unsigned char *payload);
unsigned short ml_unpack_msg_mission_count (unsigned char *payload);
mavlink_mission_item_t ml_unpack_msg_mission_item (unsigned char *payload);
short ml_queue_msg_param_request_read (char *param_id);
void ml_queue_msg_param_request_list (void);
short ml_queue_msg_param_set (char *param_id, float param_value);
short ml_queue_msg_mission_request_list (void);
short ml_queue_msg_mission_ack (void);

/***************************************************************************/
/* callback functions */

extern void ml_parse_msg(unsigned char *msg);
extern short ml_tx_update (void);

/***************************************************************************/
#endif 


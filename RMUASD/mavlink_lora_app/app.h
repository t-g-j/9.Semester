/****************************************************************************
Project:		
File:			app.h
Purpose:		Header file for app.c
Author:			Kjeld Jensen <kjeld@cetus.dk>

History:

date       name       version description 
---------- ---------- ------- -------------------------------------------
2009-03-16 Kjeld J.     1.0   software written

****************************************************************************/
/* defines */

#define true					1
#define false					0 

#define SCHED_INTERVAL  		2e4 /**< schedule interval set to 50 Hz */

#define APP_INIT_OK				0
#define APP_INIT_ERR			1

#define CFG_SER_DEV				"/dev/ttyACM0"
#define CFG_SER_BAUD			57600 
/* #define CFG_SER_BAUD			921600 */

/***************************************************************************/
/* function prototypes */

int app_init(int argc, char **argv);
int app_update(void);
void app_quit(void);

/***************************************************************************/


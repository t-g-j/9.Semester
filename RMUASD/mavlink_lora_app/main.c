/****************************************************************************
Project:		
File:           main.c
Purpose:        Scheduler
Author:         Kjeld Jensen <kjeld@cetus.dk>

History:

date       name       version description 
---------- ---------- ------- -------------------------------------------
2008-10-12 Kjeld J.     1.0   software written
2017-05-15 Kjeld J.     1.01  removed dependency of system.c
2017-12-04 Kjeld J.		1.02  added call to signal in nullhandler() to 
                              support -ansi compiler directive.

****************************************************************************/
/* system includes */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <signal.h>
#include <fcntl.h>
/* #include <sys/shm.h> */
#include <unistd.h>
#include <time.h>
#include <sched.h>
#include <sys/mman.h>
#include <sys/time.h>
#include <sys/ioctl.h>
#include <sys/timeb.h>

/***************************************************************************/
/* application includes */

#include "app.h"

/***************************************************************************/
/* variables */

static sigset_t wait_mask;

/***************************************************************************/
void nullhandler(int signo)
{
	signal(SIGALRM, nullhandler);
}
/***************************************************************************/
/* handle CTRL-C gracefully */
static void quit () /* do not add void here */
{

	/* perform application cleanup */
	app_quit();
	
	/* exit */
	exit (EXIT_SUCCESS);
}
/***************************************************************************/
static int sched_init (void)
{
	int err = false;
	/* struct sched_param my_sched_params; */
	struct itimerval interval;

	/* Setup high priority task */
	/* my_sched_params.sched_priority = sched_get_priority_max(SCHED_FIFO);
	if (! sched_setscheduler(0, SCHED_FIFO, &my_sched_params))
	{ */
		/* lock all pages in memory */
		mlockall(MCL_CURRENT | MCL_FUTURE);
	
		/* implement the signal handler to handle CTRL-C gracefully */
		signal(SIGINT, quit);
		signal(SIGTERM, quit);
	
		/* set nullhandler on SIGALRM */
		signal(SIGALRM, nullhandler);
	
		/* setup timer for periodic signal */
		sigemptyset(&wait_mask);
		interval.it_value.tv_sec = 0;
		interval.it_interval.tv_sec = 0;
		interval.it_value.tv_usec = SCHED_INTERVAL;
		interval.it_interval.tv_usec = SCHED_INTERVAL;
		setitimer( ITIMER_REAL, &interval, NULL);
	/* }
	else
	{
		printf ("Scheduling error");
		err = true;
	} */
	return err;
}
/***************************************************************************/
int main (int argc, char **argv)
{
	/* initialize scheduler */
	if (! sched_init())
	{	
		/* initialize application */
		if (app_init(argc, argv) == APP_INIT_OK)
		{
			int stop = false;
			
			while (! stop)
			{
				/* update application */
				stop = app_update();
				
				/* suspend until next event */
				sigsuspend(&wait_mask);
			}
		}
		quit();
	}
	
	return 0;
}
/***************************************************************************/

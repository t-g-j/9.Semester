# MavLink LoRa application
# Copyright (c) 2017, Kjeld Jensen <kjen@mmmi.sdu.dk> <kj@kjen.dk>
# All rights reserved.

PROJECT=mavlink_lora
SOURCES=main.c app.c mavlink_lora_lib.c serial.c monitor.c mission_get.c mission_set.c param_get.c param_set.c param_list.c position.c
CC = gcc
CFLAGS = -pedantic -ansi

default:
	@echo ""
	@echo "make............build the $(PROJECT) file"
	@echo "make clean......clean up object and executable files"
	@echo ""

	$(CC) $(CFLAGS) -I./ -o $(PROJECT) $(SOURCES)

clean:
	rm -f $(PROJECT)


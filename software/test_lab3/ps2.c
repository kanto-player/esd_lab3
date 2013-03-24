/*
 * ps2.c
 *
 *  Created on: Mar 20, 2013
 *      Author: zm2169
 */

#include "ps2.h"
#include "system.h"

#include <io.h>
#include <stdio.h>

#define PS2_READY_ADDR ((volatile unsigned char *) PS2_BASE)
#define PS2_DATA_ADDR  ((volatile unsigned char *) (PS2_BASE + 1))

#define KEY_UP_BYTE 0xf0
#define EXTENDED_BYTE 0xe0

ps2_code_t ps2_get_code(void)
{
	ps2_code_t metabyte = 0x00;
	ps2_code_t byte = 0x00;

	for (;;) {
		while (!byte) {
			while (!(metabyte = IORD_8DIRECT(PS2_BASE, 0)));
			byte = IORD_8DIRECT(PS2_BASE, 4);
		}
		return byte;
	}

	/*for (;;) {
		while (!(*PS2_READY_ADDR));
		byte = *PS2_DATA_ADDR;
		printf("here's the byte we received: %c\n", byte);

		if (byte == KEY_UP_BYTE) {
			printf("key up byte.\n");
			code |= KEY_UP;
		} else if (byte == EXTENDED_BYTE) {
			printf("extended byte.\n");
			code |= EXTENDED;
		} else {
			printf("other.\n");
			code |= byte;
			return code;
		}
	}*/
}

/*
 * ps2.c
 *
 *  Created on: Mar 20, 2013
 *      Author: zm2169
 */

#include "ps2.h"
#include "system.h"

#define PS2_READY_ADDR ((volatile unsigned char *) PS2_BASE)
#define PS2_DATA_ADDR  ((volatile unsigned char *) (PS2_BASE + 1))

#define KEY_UP_BYTE 0xf0
#define EXTENDED_BYTE 0xe0

ps2_code_t ps2_get_code(void)
{
	ps2_code_t code = 0;
	unsigned char byte;

	for (;;) {
		while (!(*PS2_READY_ADDR));
		byte = *PS2_DATA_ADDR;

		if (byte == KEY_UP_BYTE) {
			code |= KEY_UP;
		} else if (byte == EXTENDED_BYTE) {
			code |= EXTENDED;
		} else {
			code |= byte;
			return code;
		}
	}

}

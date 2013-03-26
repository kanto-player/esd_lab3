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

ps2_code_t ps2_get_code(void)
{
	ps2_code_t byte = 0x00;

	while (!byte) {
		while (!IORD_8DIRECT(PS2_BASE, 0));
		byte = IORD_8DIRECT(PS2_BASE, 4);
	}
	return byte;
}

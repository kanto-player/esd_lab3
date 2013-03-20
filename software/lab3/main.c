/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>
#include "ps2.h"

int main()
{
	ps2_code_t code;

	printf("Start typing.\n");
	for (;;) {
		code = ps2_get_code();
		if (is_key_up_extended(code))
			printf("Key Up Extended Code %x\n", 0xe000 | (code & 0x00ff));
		else if (is_key_up(code))
			printf("Key Up %x\n", (code & 0x00ff));
		else if (is_extended(code))
			printf("Extended Code %x\n", 0xe000 | (code & 0x00ff));
		else
			printf("Normal Code %x\n", (code & 0x00ff));
	}

	return 0;
}

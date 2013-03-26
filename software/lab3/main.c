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
#include "fm_synth.h"


unsigned short translate_ps2_code(ps2_code_t to_translate)
{
	unsigned short ret = 0;
	switch(to_translate) {
		case 0x1c: /* letter 'a'; low c. */
			printf("letter a; middle c.\n");
			/* add IOWRs for all of these, to the proper registers. */
			ret = 0x300;
			break;
	  	case 0x1d: /* letter 'w'; C# / Db */
	  		printf("letter w; C# / Db\n");
	  		ret = 0x2d5;
	  		break;
	  	case 0x1b: /* letter 's'; D */
	  		printf("letter s; D\n");
	  		ret = 0x2ac;
	  		break;
	  	case 0x24: /* letter 'e'; D# / Eb */
	  		printf("letter e; D# / Eb\n");
	  		ret = 0x286;
	  		break;
	  	case 0x23: /* letter 'd'; E */
	  		printf("letter d; E\n");
	  		ret = 0x262;
	  		break;
	  	case 0x2b: /* letter 'f'; F */
	  		printf("letter f; F\n");
	  		ret = 0x234;
	  		break;
	  	case 0x2c: /* letter 't'; F# / Gb */
	  		printf("letter t; F# / Gb\n");
	  		ret = 0x21f;
	  		break;
	  	case 0x34: /* letter 'g'; G */
	  		printf("letter g; G\n");
	  		ret = 0x201;
	  		break;
	  	case 0x35: /* letter 'y'; G# / Ab */
	  		printf("letter y; G# / Ab\n");
	  		ret = 0x1e4;
	  		break;
	  	case 0x33: /* letter 'h'; A */
	  		printf("letter h; A\n");
	  		ret = 0x1c9;
	  		break;
	  	case 0x3c: /* letter 'u'; A# / Bb */
	  		printf("letter u; A# / Bb\n");
	  		ret = 0x1af;
	  		break;
	  	case 0x3b: /* letter 'j'; B */
	  		printf("letter j; B\n");
	  		ret = 0x197;
	  		break;
	  	case 0x42: /* letter 'k'; middle C */
	  		printf("letter k; high C\n");
	  		ret = 0x180;
	  		break;
	  	case 0xf0:
	  		printf("BREAK CODE\n");
	  		break;
	  	default:
	  		printf("some key we're ignoring.\n");
	  		ret = 0xffff;
	  		break;
	}

	return ret;
}

int main()
{
	ps2_code_t code, endcode;
	unsigned short data_to_write = 0x0000;

	printf("Hello from Nios II!\n");
	printf("Yes, this is Dog.\n");

	IOWR_ENABLE(0x00);
	IOWR_MOD_DEPTH(0x06);
	IOWR_VOLUME(0x00);

	printf("Start typing.\n");
	for (;;) {
		code = ps2_get_code();
		if (!(data_to_write = translate_ps2_code(code))) {
			endcode = ps2_get_code();

			IOWR_ENABLE(0x00); /* enable off after receiving break code */

		} else if (data_to_write == 0xffff){
			  /* do nothing. */
		} else {
			printf("about to write the code\n");
			IOWR_NOTE(data_to_write);
			IOWR_ENABLE(0xff); /* enable high */
		}

	} /* end for */

	return 0;
}

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

static unsigned char mod_depth;
static unsigned char volume;
static unsigned char octave;

#define OCTAVE_UP 0xfffa
#define VOLUME_DEC 0xfffb
#define VOLUME_INC 0xfffc
#define MOD_DEPTH_DEC 0xfffd
#define MOD_DEPTH_INC 0xfffe
#define PS2_ERROR 0xffff

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
	  	case 0x1a:
	  		printf("dec mod depth\n");
	  		ret = MOD_DEPTH_DEC;
	  		break;
	  	case 0x22:
	  		printf("inc mod depth\n");
	  		ret = MOD_DEPTH_INC;
	  		break;
	  	case 0x21:
	  		printf("dec volume\n");
	  		ret = VOLUME_DEC;
	  		break;
	  	case 0x2a:
	  		printf("inc volume\n");
	  		ret = VOLUME_INC;
	  		break;
	  	case 0x29:
	  		printf("octave up\n");
	  		ret = OCTAVE_UP;
	  		break;
	  	default:
	  		printf("some key we're ignoring.\n");
	  		ret = PS2_ERROR;
	  		break;
	}

	return ret;
}

int main()
{
	ps2_code_t code, endcode;
	unsigned short data_to_write = 0x0000;
	unsigned short note = 0x0000;

	printf("Hello from Nios II!\n");
	printf("Yes, this is Dog.\n");

	mod_depth = 6;
	volume = 0;
	octave = 0;

	IOWR_ENABLE(0x00);
	IOWR_MOD_DEPTH(mod_depth);
	IOWR_VOLUME(volume);

	printf("Start typing.\n");
	for (;;) {
		code = ps2_get_code();
		if (!(data_to_write = translate_ps2_code(code))) {
			endcode = ps2_get_code();
			data_to_write = translate_ps2_code(endcode);

			if (data_to_write < OCTAVE_UP)
				IOWR_ENABLE(0x00); /* enable off after receiving break code */
			else if (data_to_write == OCTAVE_UP) {
				octave = 0;
				IOWR_NOTE(note >> octave);
			}

		} else if (data_to_write == VOLUME_DEC) {
			if (volume < 0xff) {
				volume++;
				printf("Volume now at %d\n", volume);
				IOWR_VOLUME(volume);
			}
		} else if (data_to_write == VOLUME_INC) {
			if (volume > 0) {
				volume--;
				printf("Volume now at %d\n", volume);
				IOWR_VOLUME(volume);
			}
		} else if (data_to_write == MOD_DEPTH_DEC) {
			if (mod_depth < 8) {
				mod_depth++;
				printf("Mod depth now at %d\n", mod_depth);
				IOWR_MOD_DEPTH(mod_depth);
			}
		} else if (data_to_write == MOD_DEPTH_INC) {
			if (mod_depth > 0) {
				mod_depth--;
				printf("Mod depth now at %d\n", mod_depth);
				IOWR_MOD_DEPTH(mod_depth);
			}
		} else if (data_to_write == OCTAVE_UP) {
			octave = 1;
			IOWR_NOTE(note >> octave);
		} else if (data_to_write == 0xffff){
			  /* do nothing. */
		} else {
			printf("about to write the code\n");
			note = data_to_write;
			IOWR_NOTE(note >> octave);
			IOWR_ENABLE(0xff); /* enable high */
		}

	} /* end for */

	return 0;
}

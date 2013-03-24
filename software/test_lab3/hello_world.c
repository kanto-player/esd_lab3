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

/*
 * for now this translates to an integer,
 * later on we can translate it to something
 * like an address offset, for when we go to write
 * to tone-corresponding registers.
 */
int translate_ps2_code(ps2_code_t to_translate)
{
	int ret = 0;
	switch(to_translate) {
		case 0x1c: /* letter 'a'; middle c. */
			printf("letter a; middle c.\n");
			/* add IOWRs for all of these, to the proper registers. */
			ret = 1;
			break;
	  	case 0x1d: /* letter 'w'; C# / Db */
	  		printf("letter w; C# / Db\n");
	  		ret = 2;
	  		break;
	  	case 0x1b: /* letter 's'; D */
	  		printf("letter s; D\n");
	  		ret = 3;
	  		break;
	  	case 0x24: /* letter 'e'; D# / Eb */
	  		printf("letter e; D# / Eb\n");
	  		ret = 4;
	  		break;
	  	case 0x23: /* letter 'd'; E */
	  		printf("letter d; E\n");
	  		ret = 5;
	  		break;
	  	case 0x2b: /* letter 'f'; F */
	  		printf("letter f; F\n");
	  		ret = 6;
	  		break;
	  	case 0x2c: /* letter 't'; F# / Gb */
	  		printf("letter t; F# / Gb\n");
	  		ret = 7;
	  		break;
	  	case 0x34: /* letter 'g'; G */
	  		printf("letter g; G\n");
	  		ret = 8;
	  		break;
	  	case 0x35: /* letter 'y'; G# / Ab */
	  		printf("letter y; G# / Ab\n");
	  		ret = 9;
	  		break;
	  	case 0x33: /* letter 'h'; A */
	  		printf("letter h; A\n");
	  		ret = 10;
	  		break;
	  	case 0x3c: /* letter 'u'; A# / Bb */
	  		printf("letter u; A# / Bb\n");
	  		ret = 11;
	  		break;
	  	case 0x3b: /* letter 'j'; B */
	  		printf("letter j; B\n");
	  		ret = 12;
	  		break;
	  	case 0x42: /* letter 'k'; high C */
	  		printf("letter k; high C\n");
	  		ret = 13;
	  		break;
	  	case 0xf0:
	  		printf("BREAK CODE\n");
	  		ret = 0;
	  		break;
	  	default:
	  		ret = -1;
	  		printf("some key we're ignoring.\n");
	}

	return ret;
}

int main()
{
  printf("Hello from Nios II!\n");
  printf("Yes, this is Dog.\n");

  ps2_code_t code, endcode;
  int translation;

  printf("Start typing.\n");
  for (;;) {
	  /* ps2_get_code blocks until receives a key stroke */
	  code = ps2_get_code();
	  /*if (is_key_up_extended(code))
		  printf("Key Up Extended Code %x\n", 0xe000 | (code & 0x00ff));
	  else if (is_key_up(code))
		  printf("Key Up %x\n", (code & 0x00ff));
	  else if (is_extended(code))
		  printf("Extended Code %x\n", 0xe000 | (code & 0x00ff));
	  else*/
	  printf("Normal Code %x\n", (code & 0x00ff));
	  if (!(translation = translate_ps2_code(code))) {
		  endcode = ps2_get_code();
		  printf("*****THE FOLLOWING KEYPRESS IS ENDING*****\n");
		  translation = translate_ps2_code(endcode);
		  printf("******************************************\n");

	  } else {
		  /* write the code to the proper register. */
		  printf("about to write the code / translation.\n");
	  }
  } /* end for */

  return 0;
}

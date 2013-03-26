/*
 * ps2.h
 *
 * Created on: Mar 20, 2013
 *      Author: zm2169
 */

#ifndef PS2_H_
#define PS2_H_

#include <stdint.h>

typedef unsigned char ps2_code_t;

/* Waits for a code to be available from the keyboard and returns it */
ps2_code_t ps2_get_code(void);

#endif /* PS2_H_ */

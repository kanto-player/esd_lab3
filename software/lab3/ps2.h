/*
 * ps2.h
 *
 * Created on: Mar 20, 2013
 *      Author: zm2169
 */

#ifndef PS2_H_
#define PS2_H_

#include <stdint.h>

typedef uint16_t ps2_code_t;

/* Reads a single codeword from the keyboard
 * Returns a 2-byte integer
 * Least-significant byte contains one-byte code
 * Most-Significant byte has KEY_UP or EXTENDED bits set in it */
ps2_code_t ps2_get_code(void);

#endif /* PS2_H_ */

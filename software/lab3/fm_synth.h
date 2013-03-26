/*
 * fm_synth.h
 *
 *  Created on: Mar 25, 2013
 *      Author: zm2169
 */

#ifndef FM_SYNTH_H_
#define FM_SYNTH_H_

#define FMS_NOTE_OFFSET 0
#define FMS_MOD_DEPTH_OFFSET 16
#define FMS_VOLUME_OFFSET 32
#define FMS_ENABLE_OFFSET 48

/*
 * 'unsigned short' in place of uint16_t,
 * 'unsigned char' in place of uint8_t
 */

void IOWR_NOTE(unsigned short data);
void IOWR_MOD_DEPTH(unsigned char data);
void IOWR_VOLUME(unsigned char data);
void IOWR_ENABLE(unsigned char data);

#endif /* FM_SYNTH_H_ */

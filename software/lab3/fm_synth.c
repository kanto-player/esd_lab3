/*
 * fm_synth.c
 *
 *  Created on: Mar 25, 2013
 *      Author: zm2169
 */

#include <io.h>
#include <system.h>
#include "fm_synth.h"

void IOWR_NOTE(unsigned short data)
{
	IOWR_16DIRECT(FM_SYNTH_BASE, FMS_NOTE_OFFSET, data);
}

void IOWR_MOD_DEPTH(unsigned char data)
{
	IOWR_8DIRECT(FM_SYNTH_BASE, FMS_MOD_DEPTH_OFFSET, data);
}

void IOWR_VOLUME(unsigned char data)
{
	IOWR_8DIRECT(FM_SYNTH_BASE, FMS_VOLUME_OFFSET, data);
}

void IOWR_ENABLE(unsigned char data)
{
	IOWR_8DIRECT(FM_SYNTH_BASE, FMS_ENABLE_OFFSET, data);
}

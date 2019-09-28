#ifndef _read_pixels_
#define _read_pixels_
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <stdbool.h>
#include <unistd.h>

	struct px
	{
	unsigned char r, g, b;
	};
	int read_pixels(char *file, struct px **pixel);
	
#endif
#ifndef _write_pixels_
#define _write_pixels_
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
	int write_pixels(char *file);
	
#endif
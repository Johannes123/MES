#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <stdbool.h>
#include <unistd.h>
#include <read_pixels.h>

void print_help(void);
int read_pixels(char *file, struct px **pixel);

int main (int argc, char *argv[])
{
  // no arguments given
	struct px *mypixel;
	if(argc == 1) 
	{
		fprintf (stderr, "This program needs arguments ...\n\n");
		print_help();
	}
    for(; optind < argc; optind++)
    {
		printf ("argument: %s\n", argv[optind]);
    }	
	read_pixels(argv[1], &mypixel);
	return 0;
}

void print_help (void)
{
	printf ("Syntax:\n");
	printf ("prog [filename] [-h]\n\n");
	exit (EXIT_FAILURE);
}
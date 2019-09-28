#include <read_pixels.h>

int read_pixels(char *file, struct px **pixel)
{
	FILE *filepointer = fopen(file, "r");
		if(!filepointer)
		{
			perror("File opening failed");
			return EXIT_FAILURE;
		}
		
		char str[80];
		int x, y;
		int clr_dpth;
		rewind(filepointer);
		
		//read P3
		fscanf(filepointer, "%s", str);
		printf("File: %s\n", str);
		if(strncmp(str, "P3", 2) != 0)
		{
			printf("wrong file extension...only for .ppm files");
			return EXIT_FAILURE;
		}
		
		//read comment #
		fscanf(filepointer, "%s", str);
		printf("Comment: %s", str);
		if(strncmp(str, "#", 1) != 0)
		{
			return EXIT_FAILURE;
		}
		
		//read comment
		fgets(str,80,filepointer);
		printf("%s", str);
		
		//read pixel x and y, read color depth
		fscanf(filepointer, "%d %d %d", &x, &y, &clr_dpth);
		printf("x:%d\ny:%d\nColor depth:%d\n", x, y, clr_dpth);
		
		*pixel = (struct px*)malloc(x * y * 3 * sizeof(unsigned char));
		if(*pixel == NULL)
		{
			return EXIT_FAILURE;
		}
		struct px *pixelcopy = *pixel;
		//read pixel with for loop
		int i_x, i_y;
		
		for(i_x = 0; i_x < x; i_x++)
		{
			for(i_y = 0; i_y < y; i_y++)
			{
				fscanf(filepointer, "%d %d %d", &(*pixel)->r, &(*pixel)->g, &(*pixel)->b);
				*pixel++;
			}
		}
		
		*pixel = pixelcopy;
		for(i_x = 0; i_x < x; i_x++)
		{
			for(i_y = 0; i_y < y; i_y++)
			{
				printf("%d %d %d\n", (*pixel)->r, (*pixel)->g, (*pixel)->b);
				*pixel++;
			}
		}
		
	fclose(filepointer);
	return 0;
}
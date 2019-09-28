#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <stdbool.h>
#include <unistd.h>

void print_help (void);

int main (int argc, char *argv[])
{
  int opt, n;
  int larg, varg, warg, rarg, garg, barg = INT_MIN;

  // no arguments given
  if (argc == 1) {
    fprintf (stderr, "This program needs arguments ...\n\n");
    print_help();
  }

  // use getopt to evaluate the parameters
  while ( (opt = getopt (argc, argv, "l:v:w:r:g:b:h")) != -1) {
    switch (opt) {
    case 'l':
      n = sscanf (optarg, "%d", &larg);
      assert (n == 1);
      break;
    case 'v':
      n = sscanf (optarg, "%d", &varg);
      assert (n == 1);
      break;
    case 'w':
      n = sscanf (optarg, "%d", &warg);
      assert (n == 1);
      break;
    case 'r':
      n = sscanf (optarg, "%d", &rarg);
      assert (n == 1);
      break;
    case 'g':
      n = sscanf (optarg, "%d", &garg);
      assert (n == 1);
      break;
	case 'b':
      n = sscanf (optarg, "%d", &barg);
      assert (n == 1);
      break;
	case 'h':
      print_help();
      break;
    case ':':
      fprintf (stderr, "Option requires an argument.\n");
      print_help ();
      break;
    case '?':
      fprintf (stderr, "Unknown option character %c.\n", optopt);
      print_help ();
      break;
    default:
      print_help ();
    }
  }
  for (; optind < argc; optind++)
    printf ("argument: %s\n", argv[optind]);

  // now we print the parameters we have got
  if (larg != INT_MIN)
    printf ("%s was invoked with -l %d\n", argv[0], larg);
  if (varg != INT_MIN)
    printf ("%s was invoked with -v %d\n", argv[0], varg);
  if (warg != INT_MIN)
    printf ("%s was invoked with -w %d\n", argv[0], warg);
  if (rarg != INT_MIN)
    printf ("%s was invoked with -r %d\n", argv[0], rarg);
  if (garg != INT_MIN)
    printf ("%s was invoked with -g %d\n", argv[0], garg);
  if (barg != INT_MIN)
    printf ("%s was invoked with -b %d\n", argv[0], barg);
  return 0;
}

void
print_help (void)
{
  printf ("Syntax:\n");
  printf ("prog [-l horizontal lines] [-v vertical lines] [-w line width] [-r read] [-g green] [-b blue] [-h]\n\n");
  printf ("The purpose of this program is to illustrate");
  printf ("the usage of getopt().\n");
  exit (EXIT_FAILURE);
}
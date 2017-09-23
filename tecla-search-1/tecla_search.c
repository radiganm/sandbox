#include <stdio.h>
#include <stdlib.h>
#include <libtecla.h>

int main(int argc, char *argv[])
{
  int i;
/*
 * Create a cache for executable files.
 */
  PathCache *pc = new_PathCache();
  if(!pc)
    exit(1);
/*
 * Scan the user's PATH for executables.
 */
  if(pca_scan_path(pc, getenv("PATH"))) {
    fprintf(stderr, "%s\n", pca_last_error(pc));
    exit(1);
  }
/*
 * Arrange to only report executable files.
 */
 pca_set_check_fn(pc, cpl_check_exe, NULL);
/*
 * Lookup and display the full pathname of each of the
 * commands listed on the command line.
 */
  for(i=1; i<argc; i++) {
    char *cmd = pca_lookup_file(pc, argv[i], -1, 0);
    printf("The full pathname of '%s' is %s\n", argv[i],
           cmd ? cmd : "unknown");
  }
  pc = del_PathCache(pc);  /* Clean up */
  return 0;
}

/* smallest.c */
/* Date  : 31 January 2018
 * Author: Ankit Pati
 */

#include <stdio.h>
#include <stdlib.h>

int main()
{
    int min, cur;

    if (scanf(" %d%*c", &cur) == EOF) {
        fprintf(stderr, "No input given!\n");
        exit(1);
    }

    for (min = cur; !feof(stdin) && !ferror(stdin); scanf(" %d%*c", &cur))
        min = min > cur ? cur : min;

    printf("Minimum = %d\n", min);

    return 0;
}
/* end of smallest.c */

/* OUTPUT

43 54 5 -3 54 94
12 43 2 -9 31 12
Minimum = -9

*/

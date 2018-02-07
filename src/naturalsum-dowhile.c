/* naturalsum-dowhile.c */
/* Date  : 31 January 2018
 * Author: Ankit Pati
 */

#include <stdio.h>

int main()
{
    int n, sum;

    sum = 0;
    scanf(" %d%*c", &n);

    do sum += n;
    while (n--);

    printf("Sum = %d\n", sum);

    return 0;
}
/* end of naturalsum-dowhile.c */

/* OUTPUT

10
Sum = 55

*/

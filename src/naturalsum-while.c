/* naturalsum-while.c */
/* Date  : 31 January 2018
 * Author: Ankit Pati
 */

#include <stdio.h>

int main()
{
    int n, sum;

    sum = 0;
    scanf(" %d%*c", &n);

    sum += n;
    while (n--) sum += n;

    printf("Sum = %d\n", sum);

    return 0;
}
/* end of naturalsum-while.c */

/* OUTPUT

10
Sum = 55

*/

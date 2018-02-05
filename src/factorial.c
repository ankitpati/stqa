/* factorial.c */
/* Date  : 31 January 2018
 * Author: Ankit Pati
 */

#include <stdio.h>
#include <limits.h>

int fac(int n)
{
    int pos, pre, ret;

    pos = n >= 0;
    if (!pos) n = -n;

    for (pre = 0, ret = 1; n; --n, pre = ret) {
        ret *= n;
        if (pre > ret) return -INT_MAX;
    }

    return pos ? ret : -ret;
}

int main()
{
    int n, nfac;

    scanf(" %d%*c", &n);

    if ((nfac = fac(n)) != -INT_MAX)
        printf("%d! = %d\n", n, nfac);
    else
        fprintf(stderr, "Factorial too large!\n");

    return 0;
}
/* end of factorial.c */

/* OUTPUT

5
5! = 120

12
12! = 479001600

13
Factorial too large!

*/

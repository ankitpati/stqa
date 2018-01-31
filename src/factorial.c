/* factorial.c */
/* Date  : 31 January 2018
 * Author: Ankit Pati
 */

#include <stdio.h>

unsigned fac(unsigned n)
{
    unsigned ret;
    for (ret = 1; n; --n) ret *= n;
    return ret;
}

int main()
{
    int n;
    scanf(" %d%*c", &n);
    printf("%d! = %c%d\n", n, n > 0 ? '\0' : '-', fac(n > 0 ? n : -n));
    return 0;
}
/* end of factorial.c */

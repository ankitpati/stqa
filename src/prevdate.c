/* prevdate.c */
/* Date  : 28 February 2018
 * Author: Ankit Pati
 */

#include <stdio.h>
#include <stdlib.h>

int isleap(unsigned year)
{
    return year % 400 ? year % 100 ? !(year % 4) : 0 : 1;
}

int isdate(unsigned d, unsigned m, unsigned y)
{
    if (d < 1 || !y) return 0; /* false == 0 */

    switch (m) {
    case 1: case 3: case 5: case 7: case 8: case 10: case 12:   /* 31 days */
        if (d > 31) return 0;
        break;

    case 4: case 6: case 9: case 11:                            /* 30 days */
        if (d > 30) return 0;
        break;

    case 2:
        if (d > 28u + isleap(y)) return 0;
        break;

    default:
        return 0;
        break;
    }

    return 1; /* true == 1 */
}

int prevdate(unsigned *d, unsigned *m, unsigned *y)
{
    if (!isdate(*d, *m, *y)) return 1; /* failure == 1 */

    --*d;
    if (!*d) {
        --*m;
        if (!*m) {
            --*y;
            *m = 12;
        }

        switch (*m) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            *d = 31;
            break;

        case 4: case 6: case 9: case 11:
            *d = 30;
            break;

        case 2:
            *d = 28u + isleap(*y);
            break;
        }
    }

    return 0; /* success == 0 */
}

int main()
{
    unsigned d, m, y;

    puts("Date (dd mm yyyy)?");
    scanf(" %u %u %u%*c", &d, &m, &y);

    if (prevdate(&d, &m, &y)) {
        fprintf(stderr, "%u-%u-%u is an invalid date!\n", d, m, y);
        exit(1);
    }

    printf("Previous Date (dd-mm-yyyy): %u-%u-%u\n", d, m, y);

    return 0;
}
/* end of prevdate.c */

/* OUTPUT

Date (dd mm yyyy)?
13 12 1995
Previous Date (dd-mm-yyyy): 12-12-1995

Date (dd mm yyyy)?
2 4 1996
Previous Date (dd-mm-yyyy): 1-4-1996

Date (dd mm yyyy)?
1 3 2000
Previous Date (dd-mm-yyyy): 29-2-2000

Date (dd mm yyyy)?
1 3 2013
Previous Date (dd-mm-yyyy): 28-2-2013

Date (dd mm yyyy)?
43 50 1995
43-50-1995 is an invalid date!

*/

/* quad.c */
/* Date  : 21 February 2018
 * Author: Ankit Pati
 */

#include <stdio.h>

int main()
{
    unsigned a, b, c;
    int d;

    puts("ax^2 + bx + c = 0");

    puts("Enter positive integers a, b, c");
    scanf(" %u %u %u%*c", &a, &b, &c);

    d = b*b - 4*a*c;

    if (!a)
        puts("Not a Quadratic Equation.");

    else if (d > 0)
        puts("Real Roots.");

    else if (d < 0)
        puts("Imaginary Roots.");

    else
        puts("Equal Roots.");

    return 0;
}
/* end of quad.c */

/* OUTPUT

ax^2 + bx + c = 0
Enter positive integers a, b, c
1 2 1
Equal Roots.

ax^2 + bx + c = 0
Enter positive integers a, b, c
43 50 50
Imaginary Roots.

ax^2 + bx + c = 0
Enter positive integers a, b, c
43 50 5
Real Roots.

*/

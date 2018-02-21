/* triangle.c */
/* Date  : 21 February 2018
 * Author: Ankit Pati
 */

#include <stdio.h>

int main()
{
    unsigned x, y, z;

    printf("Enter 3 sides of a triangle (positive integers): ");
    scanf(" %u %u %u%*c", &x, &y, &z);

    if (!x || !y || !z || x + y <= z || z + x <= y || y + z <= x)
        puts("Not a Triangle.");
    else if (x == y && y == z)
        puts("Equilateral Triangle.");
    else if (x == y || y == z || z == x)
        puts("Isosceles Triangle.");
    else
        puts("Scalene Triangle.");

    return 0;
}
/* end of triangle.c */

/* OUTPUT

Enter 3 sides of a triangle (positive integers): 43 50 5
Not a Triangle.

Enter 3 sides of a triangle (positive integers): 43 43 43
Equilateral Triangle.

Enter 3 sides of a triangle (positive integers): 43 50 43
Isosceles Triangle.

Enter 3 sides of a triangle (positive integers): 43 50 45
Scalene Triangle.

*/

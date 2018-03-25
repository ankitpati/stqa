/* triangle.c */
/* Date  : 21 February 2018
 * Author: Ankit Pati
 */

#include <stdio.h>

#define MIN   0
#define MAX 100

int main()
{
    int x, y, z;

    puts("3 sides of a triangle (integers [0, 100])?");
    scanf(" %d %d %d%*c", &x, &y, &z);

    if (x < MIN || x > MAX || y < MIN || y > MAX || z < MIN || z > MAX)
        puts("Input out of range.");
    else if (!x || !y || !z || x + y <= z || z + x <= y || y + z <= x)
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

3 sides of a triangle (integers)?
43 50 5
Not a Triangle.

3 sides of a triangle (integers)?
43 43 43
Equilateral Triangle.

3 sides of a triangle (integers)?
43 50 43
Isosceles Triangle.

3 sides of a triangle (integers)?
43 50 45
Scalene Triangle.

*/

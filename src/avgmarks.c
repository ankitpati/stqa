/* avgmarks.c */
/* Date  : 28 February 2018
 * Author: Ankit Pati
 */

#include <stdio.h>

#define NUM_STUDENTS 20
#define NUM_SUBJECTS  5

int main()
{
    unsigned i, j, m;
    double marks;

    for (i = 0; i < NUM_STUDENTS; ++i) {
        printf("Marks in 5 subjects for student %u?\n", i + 1);

        marks = 0.0f;
        for (j = 0; j < NUM_SUBJECTS; ++j) {
            scanf(" %u%*c", &m);
            marks += m;
        }

        printf("Average Marks for Student %u = %.2lf\n\n",
               i + 1, marks / NUM_SUBJECTS);
    }

    return 0;
}
/* end of avgmarks.c */

/* OUTPUT

Marks in 5 subjects for student 1?
2 2 2 2 3
Average Marks for Student 1 = 2.20

Marks in 5 subjects for student 2?
4 4 4 4 9
Average Marks for Student 2 = 5.00

Marks in 5 subjects for student 3?
5 5 5 5 6
Average Marks for Student 3 = 5.20

Marks in 5 subjects for student 4?
2 2 2 2 1
Average Marks for Student 4 = 1.80

Marks in 5 subjects for student 5?
1 4 5 7 2
Average Marks for Student 5 = 3.80

Marks in 5 subjects for student 6?
2 6 5 9 4
Average Marks for Student 6 = 5.20

Marks in 5 subjects for student 7?
8 8 9 8 7
Average Marks for Student 7 = 8.00

Marks in 5 subjects for student 8?
4 5 9 2 3
Average Marks for Student 8 = 4.60

Marks in 5 subjects for student 9?
7 5 2 2 2
Average Marks for Student 9 = 3.60

Marks in 5 subjects for student 10?
23 56 21 54 78
Average Marks for Student 10 = 46.40

Marks in 5 subjects for student 11?
21 54 65 32 98
Average Marks for Student 11 = 54.00

Marks in 5 subjects for student 12?
51 26 48 22 95
Average Marks for Student 12 = 48.40

Marks in 5 subjects for student 13?
95 48 26 67 36
Average Marks for Student 13 = 54.40

Marks in 5 subjects for student 14?
36 25 14 58 96
Average Marks for Student 14 = 45.80

Marks in 5 subjects for student 15?
47 52 63 14 58
Average Marks for Student 15 = 46.80

Marks in 5 subjects for student 16?
74 85 96 63 25
Average Marks for Student 16 = 68.60

Marks in 5 subjects for student 17?
14 57 52 14 52
Average Marks for Student 17 = 37.80

Marks in 5 subjects for student 18?
52 14 63 25 41
Average Marks for Student 18 = 39.00

Marks in 5 subjects for student 19?
72 83 27 91 91
Average Marks for Student 19 = 72.80

Marks in 5 subjects for student 20?
1 1 1 1 1
Average Marks for Student 20 = 1.00

*/

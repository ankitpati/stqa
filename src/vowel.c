/* vowel.c */
/* Date  : 31 January 2018
 * Author: Ankit Pati
 */

#include <stdio.h>
#include <ctype.h>

int main()
{
    char c;

    for (;;) {
        scanf(" %c%*c", &c);

        if (feof(stdin) || ferror(stdin)) break;

        switch (tolower(c)) {
        case 'a': case 'e': case 'i': case 'o': case 'u':
            puts("Vowel");
            break;
        default:
            puts("Consonant");
            break;
        }

        putchar('\n');
    }

    return 0;
}
/* end of vowel.c */

/* OUTPUT

q
Consonant

w
Consonant

e
Vowel

a
Vowel

43
Consonant

*/

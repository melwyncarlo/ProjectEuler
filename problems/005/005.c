#include <stdio.h>

int main() {
    int i = 1;
    while (1) {
        long int n = 20 * i;
        // Based on the rules of divisibility, not all numbers from 1 to 20 
        // have to be tested against.
        if ( ((n % 19) == 0) && ((n % 17) == 0) && ((n % 16) == 0) 
        && ((n % 13) == 0) && ((n % 11) == 0) && ((n % 9) == 0) 
        && ((n % 8) == 0) && ((n % 7) == 0) ) {
            printf("\n%ld\n\n", n);
            break;
        }
        i += 1;
    }
    return 0;
}

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main() {
    int nth = 10001;
    // Using the algorithm of Sieve of Sundaram
    int n = 1E+7;
    int k = (n - 1) / 2;
    int *integers_list = (int*)calloc(k+1, sizeof(int));
    //memset(integers_list, 1, sizeof(integers_list));
    for (int i = 1; i <= (k+1); i++) {
        //printf("i = %d\n", i);
        int j = i;
        unsigned int ij_term = i + j + (2 * i * j);
        while ((ij_term) <= k) {
            //printf("i = %d,    &    j = %d\n", i, j);
            //printf("k & X =  %d  &  %u\n", k, ij_term );
            integers_list[ij_term] = 1;
            j += 1;
            ij_term = i + j + (2 * i * j);
        }
    }
    int primes_n = 1;
    for (int i = 1; i <= (k+1); i++) {
        if (integers_list[i] == 0) {
            primes_n += 1;
            printf("\n%d.  %d\n\n", primes_n, (2 * i) + 1);
            if (primes_n == nth) {
                printf("\n%d\n\n", (2 * i) + 1);
                break;
            }
        }
    }
    free(integers_list);
    return 0;
}

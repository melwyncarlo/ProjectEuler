#include <stdio.h>
#include <stdlib.h>

int main() {
    int nth = 10001;
    int n = 1E+6;
    // Using the algorithm of Sieve of Eratosthenes
    int *integers_list = (int*)calloc(n+1, sizeof(int));
    for (int i = 2; (i*i) <= n; i++) {
        if (integers_list[i] == 0) {
            for (int j = (i*i); j <= n; j += i)
                integers_list[j] = 1;
        }
    }
    int primes_n = 0;
    for (int i = 2; i <= n; i++) {
        if (integers_list[i] == 0) {
            primes_n += 1;
            if (primes_n == nth) {
                printf("\n%d\n\n", i);
                break;
            }
        }
    }
    free(integers_list);
    return 0;
}

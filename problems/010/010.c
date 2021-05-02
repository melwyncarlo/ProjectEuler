#include <stdio.h>
#include <stdlib.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main() {
    int n = 2E+6;
    // Using the algorithm of Sieve of Eratosthenes
    long int *integers_list = (long int*)calloc(n+1, sizeof(long int));
    for (long int i = 2; (i*i) <= n; i++) {
        if (integers_list[i] == 0) {
            for (long int j = (i*i); j <= n; j += i)
                integers_list[j] = 1;
        }
    }
    long int primes_sum = 0;
    long int i = 2;
    while (i < n) {
        if (integers_list[i] == 0)
            primes_sum += i;
        i += 1;
    }
    printf("\n%ld\n\n", primes_sum);
    free(integers_list);
    return 0;
}

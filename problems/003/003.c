#include <stdio.h>
#include <stdlib.h>
#include <math.h>

/* Copyright 2021 Melwyn Francis Carlo */
/* File Reference: http://www.naturalnumbers.org/primes.html */

int main() {
    FILE *fp;
    char prime_num[10];
    long int n = 600851475143;
    char* filename = "problems/003/PrimeNumbers_Upto_1000000";
    fp = fopen(filename, "r");
    long int prime_num_max = sqrt(n);
    long int prime_num_largest = n;
    while (fgets(prime_num, 10, fp) != NULL) {
        if (atoi(prime_num) <= prime_num_max) {
            if ( (n % atoi(prime_num)) == 0 )
                prime_num_largest = atoi(prime_num);
        } else {
            break;
        }
    }
    fclose(fp);
    printf("\n%ld\n\n", prime_num_largest);
    return 0;
}

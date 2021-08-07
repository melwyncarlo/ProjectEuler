#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */
/* File Reference: http://www.naturalnumbers.org/primes.html */

int main()
{
    int smallest_odd_composite_number = 0;

    const int MAX_N = 1E5;

    FILE *fp;
    char prime_num[10];
    const char* FILE_NAME = "problems/003/PrimeNumbers_Upto_1000000";
    fp = fopen(FILE_NAME, "r");

    int primes_list[MAX_N+1];
    memset(&primes_list[0], 0, sizeof(primes_list));

    while (fgets(prime_num, 10, fp) != NULL)
    {
        if (atoi(prime_num) > MAX_N)
            break;

        primes_list[atoi(prime_num)] = 1;
    }
    fclose(fp);

    for (int i = 35; i < MAX_N; i += 2)
    {
        if (primes_list[i])
            continue;

        int j = 1;
        int prime_found = 0;
        while (++j < i)
        {
            if (!primes_list[j])
                continue;

            float b = sqrt((float)(i - j) / 2);

            if (b == (int)b)
            {
                prime_found = 1;
                break;
            }
        }

        if (!prime_found)
        {
            smallest_odd_composite_number = i;
            break;
        }
    }

    printf("%d\n", smallest_odd_composite_number);

    return 0;
}

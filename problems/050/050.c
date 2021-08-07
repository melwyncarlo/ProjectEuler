#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */
/* File Reference: http://www.naturalnumbers.org/primes.html */

int main()
{
    FILE *fp;
    char prime_num[10];
    const char* FILE_NAME = "problems/003/PrimeNumbers_Upto_1000000";
    fp = fopen(FILE_NAME, "r");

    int primes_nums[80000] = { 0 };

    int count = 22;
    int resultant_prime = 0;

    int n = 0;
    int i_start = 0;

    while (fgets(prime_num, 10, fp) != NULL)
    {
        if (atoi(prime_num) > 1E6)
            break;

        if (!i_start)
            if (atoi(prime_num) > 100000)
                i_start = n - 1;

        primes_nums[n++] = atoi(prime_num);
    }

    fclose(fp);

    int prime_found = 0;

    while (++count < 1000)
    {
        int i = i_start;
        prime_found = 0;

        while (++i < n)
        {
            const int i_by_10 = (int)(i / 10);

            for (int j = 0; j < i_by_10; j++)
            {
                int sum = 0;
                for (int k = j; k < (j + count); k++)
                    sum += primes_nums[k];

                if (sum > primes_nums[i])
                    break;

                if (sum == primes_nums[i])
                {
                    resultant_prime = primes_nums[i];
                    prime_found = 1;
                    count++;
                    break;
                }
            }

            if (prime_found)
                break;
        }
    }

    printf("%d\n", resultant_prime);

    return 0;
}

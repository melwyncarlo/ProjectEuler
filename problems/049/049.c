#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */
/* File Reference: http://www.naturalnumbers.org/primes.html */

#define N 10

int main()
{
    FILE *fp;
    char prime_num[10];
    const char* FILE_NAME = "problems/003/PrimeNumbers_Upto_1000000";
    fp = fopen(FILE_NAME, "r");

    int  primes_nums[1200][N]            = { 0 };
    char primes_digits[1200][11]         = { 0 };
    int  primes_digits_occurrences[1200] = { 0 };

    int i = 0;
    while (fgets(prime_num, 10, fp) != NULL)
    {
        if (atoi(prime_num) < 1000)
            continue;

        if (atoi(prime_num) > 9999)
            continue;

        char prime_digits[11] = "0000000000";

        prime_digits[prime_num[0]-'0'] = '1';
        prime_digits[prime_num[1]-'0'] = '1';
        prime_digits[prime_num[2]-'0'] = '1';
        prime_digits[prime_num[3]-'0'] = '1';

        int duplicate_found = 0;
        for (int j = 0; j < i; j++)
        {
            if (strcmp(primes_digits[j], prime_digits) == 0)
            {
                if (primes_nums[j][N-1] == 0)
                {
                    for (int k = 1; k < N; k++)
                    {
                        if (primes_nums[j][k] == 0)
                        {
                            primes_nums[j][k] = atoi(prime_num);
                            break;
                        }
                    }

                    primes_digits_occurrences[j]++;
                }

                duplicate_found = 1;
                break;
            }
        }

        if (!duplicate_found)
        {
            primes_digits_occurrences[i] = 0;
            primes_nums[i][0] = atoi(prime_num);
            memcpy(&primes_digits[i++][0], &prime_digits[0], 10);
        }
    }

    int j = 0;
    int k = 0;
    int l = 0;
    int m = 0;
    int sequence_found = 0;
    for (j = 0; j < i; j++)
    {
        if (primes_digits_occurrences[j] < 3)
            continue;

        for (k = 0; k <= (N - 3); k++)
        {
            if (primes_nums[j][k] == 0)
                break;

            if (primes_nums[j][k] == 1487)
                continue;

            for (l = (k + 1); l <= (N - 2); l++)
            {
                if (primes_nums[j][l] == 0)
                    break;

                for (m = (l + 1); m < N; m++)
                {
                    if (primes_nums[j][m] == 0)
                        break;

                    if ((primes_nums[j][m] - primes_nums[j][l]) 
                    ==  (primes_nums[j][l] - primes_nums[j][k]))
                    {
                        sequence_found = 1;
                        break;
                    }
                }

                if (sequence_found)
                    break;
            }

            if (sequence_found)
                break;
        }

        if (sequence_found)
            break;
    }

    fclose(fp);

    printf("%d%d%d\n", primes_nums[j][k], primes_nums[j][l], primes_nums[j][m]);

    return 0;
}

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */
/* File Reference: http://www.naturalnumbers.org/primes.html */

int main()
{
    int sub_count   = 0;
    int main_count  = 0;

    const int MAX_N = 5E5;

    FILE *fp;
    char prime_num[10];
    const char* FILE_NAME = "problems/003/PrimeNumbers_Upto_1000000";
    fp = fopen(FILE_NAME, "r");

    int primes_list[(int)(MAX_N/10)];
    memset(&primes_list[0], 0, sizeof(primes_list));

    int i = 0;
    while (fgets(prime_num, 10, fp) != NULL)
    {
        if (atoi(prime_num) > MAX_N)
            break;

        primes_list[i++] = atoi(prime_num);
    }
    fclose(fp);

    for (i = 1000; i <= MAX_N; i++)
    {
        sub_count = 0;
        int j = -1;
        int temp_i = i;
        const int i_by_5 = (int)(i / 5);
        while (primes_list[++j] < i_by_5)
        {
            if ((temp_i % primes_list[j]) != 0)
                continue;

            while ((temp_i % primes_list[j]) == 0)
                temp_i /= primes_list[j];

            if (++sub_count == 4)
                break;
        }

        if (sub_count != 4)
        {
            main_count = 0;
            continue;
        }

        if (++main_count == 4)
            break;
    }

    printf("%d\n", i - 3);

    return 0;
}

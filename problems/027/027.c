#include <stdio.h>
#include <stdlib.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    FILE *fp;
    char prime_num[10];
    const char* FILE_NAME = "problems/003/PrimeNumbers_Upto_1000000";
    fp = fopen(FILE_NAME, "r");

    int *primes_list = (int*)calloc(1E3, sizeof(int));

    int a       = -999;
    int b_count =    0;

    int a_max = 0;
    int b_max = 0;
    int n_max = 0;

    int i = 0;
    while ((fgets(prime_num, 10, fp) != NULL) && (i != 1000))
    {
        if (atoi(prime_num) < 1000)
            b_count++;

        primes_list[i++] = atoi(prime_num);
    }

    while (a < 1000)
    {
        int b = 0;
        while (b < b_count)
        {
            int n = 1;
            int j = 0;
            int max_prime = (n * n) + (a * n) + primes_list[b];

            while (j < 1E3)
            {
                if (primes_list[j] > max_prime)
                    break;

                if (max_prime == primes_list[j])
                {
                    n++;
                    j = 0;
                    max_prime = (n * n) + (a * n) + primes_list[b];
                    continue;
                }

                j++;
            }

            if (n > n_max)
            {
                n_max = n;
                a_max = a;
                b_max = primes_list[b];
            }

            b++;
        }

        a++;
    }

    fclose(fp);
    free(primes_list);

    printf("%d\n", a_max * b_max);

    return 0;
}

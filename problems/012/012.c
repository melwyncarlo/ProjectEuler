#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */
/* File Reference: http://www.naturalnumbers.org/primes.html */

int main()
{
    FILE *fp;
    char prime_num[10];
    char* filename = "problems/003/PrimeNumbers_Upto_1000000";

    int n;
    int count = 0;
    int divisors_n = 1;

    while (divisors_n <= 500)
    {
        n = 1001 + (1000 * count);
        int n_max = n + 999;
        int divisors_arr[2][501];

        while (n <= n_max)
        {
            int n_sum = n * (n + 1) / 2;

            memset(divisors_arr, 0, sizeof(divisors_arr));

            while (n_sum != 1)
            {
                fp = fopen(filename, "r");

                while (fgets(prime_num, 10, fp) != NULL)
                {
                    if ( (n_sum % atoi(prime_num)) == 0 )
                    {
                        int index = -1;

                        for (int i = 1; i <= divisors_arr[0][0]; i++)
                        {
                            if (divisors_arr[1][i] == atoi(prime_num))
                            {
                                index = i;
                                break;
                            }
                        }

                        if (index == -1)
                        {
                            divisors_arr[0][0]++;
                            divisors_arr[0][divisors_arr[0][0]]++;
                            divisors_arr[1][divisors_arr[0][0]] = atoi(prime_num);
                        }
                        else
                        {
                            divisors_arr[0][index]++;
                        }

                        n_sum /= atoi(prime_num);
                        break;
                    }
                }

                fclose(fp);
            }

            divisors_n = 1;
            for (int i = 1; i <= divisors_arr[0][0]; i++)
            {
                divisors_n *= (divisors_arr[0][i] + 1);
            }

            n++;

            if (divisors_n > 500)
                break;
        }

        count++;
    }

    n--;

    printf("%d\n", n * (n + 1) / 2);

    return 0;
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    /* The initial count denotes the prime numbers 2, 3, 5, and 7. */
    int count = 4;

    const int MAX_NUM = 1E6;

    int start_index[7] = { 0, 0, 0, 0, 0, 0 };

    FILE *fp;
    char prime_num[10];
    const char* FILE_NAME = "problems/003/PrimeNumbers_Upto_1000000";
    fp = fopen(FILE_NAME, "r");

    char **primes_list = (char**)malloc(MAX_NUM * sizeof(char*));
    for (int i = 0; i < MAX_NUM; i++)
        primes_list[i] = (char*)calloc(10, sizeof(char));

    int primes_n     = 0;
    int previous_len = 1;
    while (fgets(prime_num, 10, fp) != NULL)
    {
        if (atoi(prime_num) >= MAX_NUM)
            break;

        if (strstr(prime_num, "0") != NULL)
            continue;

        if (strstr(prime_num, "2") != NULL)
            continue;

        if (strstr(prime_num, "5") != NULL)
            continue;

        if ((int)strlen(prime_num) > previous_len)
            start_index[++previous_len] = primes_n;

        memcpy(&primes_list[primes_n++][0], &prime_num[0], strlen(prime_num) - 1);
    }

    for (int i = 2; i < primes_n; i++)
    {
        const int main_prime_len = (int)strlen(primes_list[i]);

        char main_prime[main_prime_len+1];
        main_prime[main_prime_len] = 0;
        memcpy(&main_prime[0], &primes_list[i][0], main_prime_len);

        const int local_start_index = start_index[main_prime_len];

        int prime_found = 0;
        for (int j = 2; j <= main_prime_len; j++)
        {
            int temp_val = main_prime[0];
            for (int k = 1; k < main_prime_len; k++)
                main_prime[k-1] = main_prime[k];
            main_prime[main_prime_len-1] = temp_val;

            prime_found = 0;
            int main_prime_num = atoi(main_prime);

            if ((main_prime_num % 7) == 0)
                break;

            for (int k = local_start_index; k < primes_n; k++)
            {
                if (atoi(primes_list[k]) > main_prime_num)
                    break;

                if (atoi(primes_list[k]) == main_prime_num)
                {
                    prime_found = 1;
                    break;
                }
            }

            if (!prime_found)
                break;
        }

        if (prime_found)
            count++;
    }

    for (int i = 0; i < MAX_NUM; i++)
        free(primes_list[i]);
    free(primes_list);

    fclose(fp);

    printf("%d\n", count);

    return 0;
}

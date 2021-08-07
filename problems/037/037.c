#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    int sum = 0;

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

        if ((int)strlen(prime_num) > previous_len)
            start_index[++previous_len] = primes_n;

        memcpy(&primes_list[primes_n++][0], &prime_num[0], strlen(prime_num) - 1);
    }

    for (int i = 4; i < primes_n; i++)
    {
        const int main_prime_len = (int)strlen(primes_list[i]);

        char main_prime[main_prime_len+1];
        main_prime[main_prime_len] = 0;
        memcpy(&main_prime[0], &primes_list[i][0], main_prime_len);

        int prime_1_found = 0;
        int prime_2_found = 0;
        for (int j = 1; j < main_prime_len; j++)
        {
            char ltr[j+1];
            char rtl[j+1];
            ltr[j] = 0;
            rtl[j] = 0;
            memcpy(&ltr[0], &main_prime[0], j);
            memcpy(&rtl[0], &main_prime[main_prime_len-j], j);

            prime_1_found = 0;
            prime_2_found = 0;

            int k = start_index[j];
            while ((prime_1_found == 0) || (prime_2_found == 0))
            {
                if ((atoi(primes_list[k]) > atoi(ltr))
                &&  (atoi(primes_list[k]) > atoi(rtl)))
                    break;

                if (atoi(primes_list[k]) == atoi(ltr))
                    prime_1_found = 1;

                if (atoi(primes_list[k]) == atoi(rtl))
                    prime_2_found = 1;

                k++;
                if (k == primes_n)
                    break;
            }

            if ((!prime_1_found) || (!prime_2_found))
                break;
        }

        if (prime_1_found && prime_2_found)
            sum += atoi(main_prime);
    }

    for (int i = 0; i < MAX_NUM; i++)
        free(primes_list[i]);
    free(primes_list);

    fclose(fp);

    printf("%d\n", sum);

    return 0;
}

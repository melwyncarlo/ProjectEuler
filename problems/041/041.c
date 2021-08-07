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

    int largest_pandigital_prime = 0;

    const char DIGIT[9] = "123456789";

    while (fgets(prime_num, 10, fp) != NULL)
    {
        if (atoi(prime_num) > 7654321)
            break;

        int str_len = (int)strlen(prime_num) - 1;

        int is_pandigital = 1;
        for (int i = 0; i < str_len; i++)
        {
            if (strchr(prime_num, DIGIT[i]) == NULL)
            {
                is_pandigital = 0;
                break;
            }
        }

        if (is_pandigital)
            if (atoi(prime_num) > largest_pandigital_prime)
                largest_pandigital_prime = atoi(prime_num);
    }

    fclose(fp);

    printf("%d\n", largest_pandigital_prime);

    return 0;
}

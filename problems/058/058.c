#include <stdio.h>
#include <stdlib.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    int side_length = 1;

    FILE *fp;
    int is_prime_num = 0;
    const char* FILE_NAME = "problems/058/Prime_Numbers_of_First_700_Million_Natural_Numbers";

    fp = fopen(FILE_NAME, "r");

    int i        = 0;
    int num      = 1;
    int primes_n = 0;

    while (1)
    {
        side_length += 2;

        for (int side = 1; side <= 3; side++)
        {
            num += side_length - 1;

            while (i++ < num)
                is_prime_num = fgetc(fp) - '0';
            i--;

            if (is_prime_num)
                primes_n++;
        }

        num += side_length - 1;

        double ratio_percentage = (double)primes_n 
                                / (double)(side_length + side_length - 1);

        if (ratio_percentage < 0.1)
            break;
    }

    fclose(fp);

    printf("%d\n", side_length);

    return 0;
}

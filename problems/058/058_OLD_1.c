#include <stdio.h>
#include <stdlib.h>
#include <math.h>

/* Copyright 2021 Melwyn Francis Carlo */
/* File Reference: http://www.naturalnumbers.org/primes.html */

int main()
{
    int side_length = 1;

    FILE *fp;
    char prime_num_str[10];
    const char* FILE_NAME = "problems/003/PrimeNumbers_Upto_1000000";

    int prime_num = 0;

    fp = fopen(FILE_NAME, "r");

    int num      = 1;
    int primes_n = 0;

    while (1)
    {
        side_length += 2;

        for (int side = 1; side <= 3; side++)
        {
            num += side_length - 1;

            while (prime_num <= num)
            {
                if (num == prime_num)
                {
                    primes_n++;
                    break;
                }

                if (fgets(prime_num_str, 10, fp) == NULL)
                    break;

                prime_num = atoi(prime_num_str);
//printf("%d\n", prime_num);
            }
        }

        num += side_length - 1;

        double ratio_percentage = (double)primes_n 
                                / (double)(side_length + side_length - 1);
printf("%d  =>  %d / %d = %lf%%\n", side_length, primes_n, side_length + side_length - 1, ratio_percentage * 100.0);
        if (ratio_percentage < 0.1)
            break;
    }

    fclose(fp);

    printf("%d\n", side_length);

    return 0;
}

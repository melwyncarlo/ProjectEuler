#include <stdio.h>

/* Copyright 2021 Melwyn Francis Carlo */

#define MAX_N 10000

int main()
{
    int amicable_numbers[MAX_N] = { 0 };

    for (int i = 2; i < MAX_N; i++)
    {
        int proper_divisors_sum_1 = 0;
        int proper_divisors_sum_2 = 0;

        int j_max = (int)(i / 2);
        for (int j = 1; j <= j_max; j++)
        {
            if ((i % j) == 0)
                proper_divisors_sum_1 += j;
        }

        j_max = (int)(proper_divisors_sum_1 / 2);
        for (int j = 1; j <= j_max; j++)
        {
            if ((proper_divisors_sum_1 % j) == 0)
                proper_divisors_sum_2 += j;
        }

        if ((i == proper_divisors_sum_2) && (i != proper_divisors_sum_1))
        {
            amicable_numbers[i]  = 1;
            amicable_numbers[proper_divisors_sum_1] = 1;
        }
    }

    int n = 0;
    for (int i = 1; i < MAX_N; i++)
        n += (i * amicable_numbers[i]);

    printf("%d\n", n);

    return 0;
}

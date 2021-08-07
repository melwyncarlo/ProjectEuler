#include <stdio.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    int abundant_numbers[10000] = { 0 };

    int n = 1;
    int count = 0;

    for (int i = 2; i <= 28123; i++)
    {
        int proper_divisors_sum = 0;

        int j_max = (int)(i / 2);
        for (int j = 1; j <= j_max; j++)
        {
            if ((i % j) == 0)
                proper_divisors_sum += j;
        }

        if (proper_divisors_sum > i)
        {
            abundant_numbers[count] = i;
            count++;
        }

        int count_by_2 = (int)(count / 2);
        int abundant_sum_found = 0;

        for (int j = 0; j < count_by_2; j++)
        {
            int k = j;
            while ((abundant_numbers[j] + abundant_numbers[k]) < i)
            {
                k++;
            }
            if ((abundant_numbers[j] + abundant_numbers[k]) == i)
            {
                abundant_sum_found = 1;
                break;
            }
        }
        if (!abundant_sum_found)
            n += i;
    }

    printf("%d\n", n);

    return 0;
}

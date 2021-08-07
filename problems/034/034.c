#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    const int factorials[10] = { 1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880 };

    int sum = 0;

    for (int i = 100; i <= 1E5; i++)
    {
        char i_str[10] = { 0 };
        sprintf(&i_str[0], "%d", i);

        int digits_sum = 0;
        for (int j = 0; j < (int)strlen(i_str); j++)
        {
            char i_str_digit[2] = { i_str[j] };
            digits_sum += factorials[atoi(i_str_digit)];
        }

        if (digits_sum == i)
            sum += i;
    }

    printf("%d\n", sum);

    return 0;
}

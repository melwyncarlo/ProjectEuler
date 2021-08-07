#include <math.h>
#include <stdio.h>
#include <stdlib.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    int sum = 0;

    for (int i = 2; i <= 1E6; i++)
    {
        int  str_length = (int)log10(i) + 1;
        char str[str_length+1];
        str[str_length] = 0;
        sprintf(&str[0], "%d", i);

        int sum_of_powers = 0;

        for (int j = 0; j < str_length; j++)
        {
            char digit[2] = { str[j] };
            sum_of_powers += pow(atoi(digit), 5);
        }

        if (sum_of_powers == i)
            sum += i;
    }

    printf("%d\n", sum);

    return 0;
}

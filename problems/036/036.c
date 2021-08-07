#include <stdio.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    /* Initial values denoting the numbers 0, 1, 3, 5, 7, and 9. */
    int sum = 25;

    for (int i = 10; i <= 1E6; i++)
    {
        if ((i % 2) == 0)
            continue;

        char decimal[10] = { 0 };
        sprintf(&decimal[0], "%d", i);
        const int decimal_len = strlen(decimal);

        int is_decimal_palindromic = 1;

        if (decimal_len != 1)
        {
            for (int j = 0; j < (decimal_len / 2); j++)
            {
                if (decimal[j] != decimal[decimal_len-j-1])
                {
                    is_decimal_palindromic = 0;
                    break;
                }
            }
        }

        if (!is_decimal_palindromic)
            continue;

        char binary[31]  = { 0 };

        int j = 0;
        int quotient = i;
        while (quotient != 0)
        {
            sprintf(&binary[j++], "%d", quotient % 2);
            quotient  = (int)(quotient / 2);
        }

        int is_binary_palindromic = 1;

        for (int j = 0; j < (int)(strlen(binary) / 2); j++)
        {
            if (binary[j] != binary[strlen(binary)-j-1])
            {
                is_binary_palindromic = 0;
                break;
            }
        }

        if (!is_binary_palindromic)
            continue;

        sum += i;
    }

    printf("%d\n", sum);

    return 0;
}

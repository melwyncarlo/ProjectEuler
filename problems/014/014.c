#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    int n_count = 1E5;

    int max_count = 0;
    int max_count_number = 0;

    while (n_count < 1E6)
    {
        int i_count = 0;
        long int n = n_count;

        while (n != 1)
        {
            if ((n % 2) == 0)
            {
                n /= 2;
            }
            else
            {
                n = (3 * n) + 1;
            }

            i_count++;
        }

        i_count++;

        if (i_count > max_count)
        {
            max_count        = i_count;
            max_count_number = n_count;
        }

        n_count++;
    }

    printf("%d\n", max_count_number);

    return 0;
}

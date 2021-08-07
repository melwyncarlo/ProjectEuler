#include <math.h>
#include <stdio.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    const int NX    =  6;
    const int N_MAX = 10;

    int n           = 6;
    int num_1x      = 125874;

    int num_nx, same_digits;

    while (n != N_MAX)
    {
        const int NUM_MAX = (int)(5.0 * pow(10.0, (double)n - 1.0) / 3);

        while (++num_1x <= NUM_MAX)
        {
            num_nx = 0;
            char num_nx_str[NX][n];
            memset(&num_nx_str[0][0], 0, sizeof(num_nx_str));

            char digits_set_1[N_MAX+1];
            memset(&digits_set_1[0], '0', sizeof(digits_set_1));
            digits_set_1[N_MAX] = 0;

            for (int k = 0; k < NX; k++)
            {
                num_nx += num_1x;
                sprintf(&num_nx_str[k][0], "%d", num_nx);

                char digits_set_2[N_MAX+1];
                memset(&digits_set_2[0], '0', sizeof(digits_set_2));
                digits_set_2[N_MAX] = 0;

                for (int l = 0; l < NX; l++)
                    digits_set_2[num_nx_str[k][l] - '0'] = '1';

                if (k == 0)
                {
                    strcpy(&digits_set_1[0], &digits_set_2[0]);
                    continue;
                }

                same_digits = 1;

                if (strcmp(digits_set_1, digits_set_2) != 0)
                {
                    same_digits = 0;
                    break;
                }
            }

            if (same_digits)
                break;
        }

        if (same_digits)
            break;

        n++;
    }

    printf("%d\n", num_1x);

    return 0;
}

#include <math.h>
#include <stdio.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

# define DECIMAL_PRECISION 102
/* 102 decimal digits (RHS), 1 integer digit (LHS),             */
/* 1 decimal point character, and 1 null terminating character. */
# define MAX_CHAR          105

void square_root(char root[MAX_CHAR], int num)
{
    char remainder_temp[MAX_CHAR] = { 0 };
    char      remainder[MAX_CHAR] = { 0 };
    char         p_x_20[MAX_CHAR] = { 0 };
    char         y_temp[MAX_CHAR] = { 0 };
    char              y[MAX_CHAR] = { 0 };

    int x;

    int sqrt_num = (int)sqrt(num);
    sprintf(&root[0],      "%0104d", sqrt_num);
    sprintf(&remainder[0], "%0102d", num - (sqrt_num * sqrt_num));

    remainder[MAX_CHAR-2] = '0';
    remainder[MAX_CHAR-3] = '0';

    for (int i = 0; i < DECIMAL_PRECISION; i++)
    {
        memset(&p_x_20[0], '0', MAX_CHAR-1);

        int root_digit_x_2 = 0;

        for (int j = (MAX_CHAR - 2); j > 0; j--)
        {
            root_digit_x_2 = (root_digit_x_2 / 10) 
                           + root[j] - '0' 
                           + root[j] - '0';

            p_x_20[j-1]    = (root_digit_x_2 % 10) + '0';
        }

        x = 0;
        int decrement_y = 0;
        memset(&y[0], '0', 104);

        if (strcmp(p_x_20, remainder) < 0)
        {
            memcpy(&y[0], &p_x_20[0], MAX_CHAR - 1);
            y[MAX_CHAR-2] = '1';

            for (x = 2; x <= 9; x++)
            {
                memset(&y_temp[0], '0', MAX_CHAR - 1);

                p_x_20[MAX_CHAR-2] = x + '0';

                int temp_product = 0;

                for (int k = (MAX_CHAR - 2); k > 0; k--)
                {
                    temp_product = (temp_product / 10) 
                                 + ((p_x_20[k] - '0') *  x);

                    y_temp[k]    = (temp_product % 10) + '0';
                }

                if (strcmp(y_temp, remainder) > 0)
                {
                    decrement_y = 1;
                    break;
                }

                memcpy(&y[0], &y_temp[0], MAX_CHAR - 1);
            }
        }

        if (x == 10)
            x--;

        if (decrement_y)
            x--;

        for (int j = 0; j < (MAX_CHAR - 2); j++)
            root[j] = root[j+1];

        root[MAX_CHAR-2] = x + '0';

        int carry_val = 0;

        memcpy(&remainder_temp[0], &remainder[0], MAX_CHAR - 1);

        remainder[MAX_CHAR-2]  = '0';
        remainder[MAX_CHAR-3] = '0';

        for (int j = (MAX_CHAR - 2); j >= 2; j--)
        {
            int temp_val = remainder_temp[j] - y[j] - carry_val;

            if (temp_val < 0)
            {
                temp_val += 10;
                carry_val =  1;
            }
            else
            {
                carry_val = 0;
            }

            remainder[j-2] = temp_val + '0';
        }
    }

    if ((root[MAX_CHAR-2] - '0') >= 5)
    {
        int last_digit = root[MAX_CHAR-3] - '0' + 1;

        root[MAX_CHAR-3] = (last_digit % 10) + '0';

        if (last_digit > 9)
        {
            root[MAX_CHAR-3] = '0';

            int i = MAX_CHAR - 3;
            while (1)
            {
                if (root[--i] == '9')
                {
                    root[i] = '0';
                }
                else
                {
                    root[i] += 1;
                    break;
                }
            }
        }
    }
}

int main()
{
    int total_of_digital_sums = 0;

    char sqrt_val[MAX_CHAR] = { 0 };

    for (int i = 2; i < 100; i++)
    {
        if ((i ==  4) || (i ==  9) || (i == 16) || (i == 25) 
        ||  (i == 36) || (i == 49) || (i == 64) || (i == 81))
            continue;

        square_root(sqrt_val, i);

        int digital_sum = 0;
        for (int i = 0; i <= 100; i++)
            digital_sum += sqrt_val[i] - '0';

        total_of_digital_sums += digital_sum;
    }

    printf("%d\n", total_of_digital_sums);

    return 0;
}

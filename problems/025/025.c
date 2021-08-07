#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    char fibonacci_val[3][1001];

    memset(fibonacci_val[0], '0', sizeof(fibonacci_val[0]));
    memset(fibonacci_val[1], '0', sizeof(fibonacci_val[1]));
    memset(fibonacci_val[2], '0', sizeof(fibonacci_val[2]));

    fibonacci_val[0][997] = '1';
    fibonacci_val[0][998] = '4';
    fibonacci_val[0][999] = '4';
    fibonacci_val[1][998] = '8';
    fibonacci_val[1][999] = '9';
    fibonacci_val[2][998] = '5';
    fibonacci_val[2][999] = '5';

    fibonacci_val[0][1000] = 0;
    fibonacci_val[1][1000] = 0;
    fibonacci_val[2][1000] = 0;

    int val_1_length = 3;
    int val_2_length = 2;

    int i = 12;

    while (fibonacci_val[0][0] == '0')
    {
        memcpy(fibonacci_val[2], fibonacci_val[1], 1000);
        memcpy(fibonacci_val[1], fibonacci_val[0], 1000);

        int str_length   = val_1_length;
        if (val_2_length > val_1_length)
            str_length = val_2_length;
        str_length = ( (int)((str_length - 1) / 10) + 1 ) * 10;

        char summand_1[11] = { 0 };
        char summand_2[11] = { 0 };

        int val_0_length = 0;

        for (int j = 0; j < str_length; j += 10)
        {
            memcpy(&summand_1[0], &fibonacci_val[1][990-j], 10);
            memcpy(&summand_2[0], &fibonacci_val[2][990-j], 10);

            long int summation = atol(summand_1) 
                               + atol(summand_2) 
                               + (int)(fibonacci_val[0][999-j] - '0') * (j != 0);

            char temp_str[12];
            sprintf(&temp_str[0], "%011lu", summation);

            int temp_index = 989 - j;
            if (temp_index < 0)
                temp_index = 0;

            memcpy( &fibonacci_val[0][temp_index], 
                    &temp_str[(temp_index==0)], 
                    11 - (temp_index==0));

            if (j == (str_length - 10))
                val_0_length = j + (int)log10(summation) + 1;
        }

        val_2_length = val_1_length;
        val_1_length = val_0_length;

        i++;
    }

    printf("%d\n", i);

    return 0;
}

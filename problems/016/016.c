#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    char n_str[500] = "1024";

    char products_array[500][500];

    int str_length  = 4;

    for (int i = 2; i <= 100; i++)
    {
        for (int j = (str_length - 1); j >= 0; j--)
        {
            char temp_product[4+1];
            const char temp_char[2] = { n_str[j] };
            sprintf(temp_product, "%04d", 1024 * atoi(temp_char));

            for (int k1 = 0; k1 <= j; k1++)
                products_array[j][k1] = '0';

            for (int k2 = (j + 1); k2 < (j + 5); k2++)
                products_array[j][k2] = temp_product[k2-j-1];

            for (int k3 = (j + 5); k3 < (str_length + 4); k3++)
                products_array[j][k3] = '0';
        }

        memset(n_str, 0, sizeof(n_str));

        n_str[str_length + 4 - 1] = '0';

        for (int k = (str_length + 4 - 1); k > 0; k--)
        {
            int temp_sum = 0;
            for (int j = 0; j < str_length; j++)
                temp_sum += products_array[j][k] - '0';

            temp_sum  += n_str[k] - '0';
            n_str[k]   = ((temp_sum % 10) + '0');
            n_str[k-1] = ((int)(temp_sum / 10) + '0');
        }

        str_length += 4;
    }

    int sum_of_digits = 0;
    for (int i = 0; i < str_length; i++)
        sum_of_digits += n_str[i] - '0';

    printf("%d\n", sum_of_digits);

    return 0;
}

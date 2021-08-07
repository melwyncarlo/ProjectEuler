#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    const int MAX_N = 1000;

    char sum[11] = "0000000001";

    for (int i = 2; i <= MAX_N; i++)
    {
        if ((i % 10) == 0)
            continue;

        int carry_val;
        int temp_val;

        char product[11] = "0000000001";

        for (int j = 0; j < i; j++)
        {
            char sub_product_sum[10][11];
            memset(&sub_product_sum[0], '0', sizeof(sub_product_sum));

            for (int k = 9; k >= 0; k--)
            {
                char digit[2] = { product[k] };

                int sub_product = atoi(digit) * i;

                char temp_str[21] = { 0 };
                sprintf(&temp_str[0], "%010d", sub_product);

                sub_product_sum[k][10] = 0;
                memcpy(&sub_product_sum[k][0], &temp_str[strlen(temp_str)-k-1], k + 1);
            }

            carry_val = 0;
            for (int l = 9; l >= 0; l--)
            {
                temp_val  = sub_product_sum[0][l] 
                          + sub_product_sum[1][l] 
                          + sub_product_sum[2][l] 
                          + sub_product_sum[3][l] 
                          + sub_product_sum[4][l] 
                          + sub_product_sum[5][l] 
                          + sub_product_sum[6][l] 
                          + sub_product_sum[7][l] 
                          + sub_product_sum[8][l] 
                          + sub_product_sum[9][l] 
                          - ('0' * 10) 
                          + carry_val;
                carry_val = (int)(temp_val / 10);

                product[l] = '0' + (temp_val % 10);
            }
        }

        carry_val = 0;
        for (int j = 9; j >= 0; j--)
        {
            int temp_val = sum[j] + product[j] - '0' - '0' + carry_val;

            carry_val    = (int) (temp_val / 10);
            sum[j]       = '0' + (temp_val % 10);
        }
    }

    printf("%s\n", sum);

    return 0;
}

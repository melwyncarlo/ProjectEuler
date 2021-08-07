#include <stdio.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

void power(char power_val[202], int a, int b)
{
    sprintf(&power_val[0], "%0201d", a);

    char temp_power_val[202] = { 0 };

    int a1 = a / 10;
    int a2 = a % 10;

    for (int i = 1; i < b; i++)
    {
        char temp_product_1[202] = { 0 };
        char temp_product_2[202] = { 0 };

        temp_product_1[0]   = '0';
        temp_product_2[0]   = '0';
        temp_product_1[200] = '0';
        temp_product_2[200] = '0';

        int carry_val_0 = 0;
        int carry_val_1 = 0;
        int carry_val_2 = 0;

        for (int j = 200; j >=1 ; j--)
        {
            int temp_sub_product_1 = ((power_val[j] - '0') * a2) 
                                   +   carry_val_1;
            carry_val_1            = temp_sub_product_1 / 10;
            temp_product_1[j]      = (temp_sub_product_1 % 10) + '0';

            int temp_sub_product_2 = ((power_val[j] - '0') * a1) 
                                   +   carry_val_2;
            carry_val_2            = temp_sub_product_2 / 10;
            temp_product_2[j-1]    = (temp_sub_product_2 % 10) + '0';

            int temp_sum = temp_product_1[j] - '0' 
                         + temp_product_2[j] - '0' 
                         + carry_val_0;
            carry_val_0 = temp_sum / 10;

            temp_power_val[j] = (temp_sum % 10) + '0';
        }
        temp_power_val[0] = carry_val_0 + '0';

        memcpy(&power_val[0], &temp_power_val[0], 201);
    }
}

int main()
{
    int n = 0;

    char power_val[202] = { 0 };

    for (int i = 1; i < 100; i++)
    {
        for (int j = 1; j < 100; j++)
        {
            power(power_val, i, j);

            int index = 0;

            while (power_val[index] == '0')
                index++;

            if ((201 - index) > j)
                break;

            if ((201 - index) == j)
                n++;
        }
    }

    printf("%d\n", n);

    return 0;
}

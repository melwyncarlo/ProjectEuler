#include <stdio.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

int power_digit_check(int a)
{
    int n = 0;

    char      power_val[202] = { 0 };
    char temp_power_val[202] = { 0 };

    memset(&power_val[0], '0', 200);
    power_val[200] = '1';

    int a1 = a / 10;
    int a2 = a % 10;

    for (int i = 1; i < 100; i++)
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

        int index = 0;

        while (temp_power_val[index] == '0')
            index++;

        if ((201 - index) > i)
            break;

        if ((201 - index) == i)
            n++;

        memcpy(&power_val[0], &temp_power_val[0], 201);
    }

    return n;
}

int main()
{
    int n = 0;

    for (int i = 1; i < 100; i++)
        n += power_digit_check(i);

    printf("%d\n", n);

    return 0;
}

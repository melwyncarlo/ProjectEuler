#include <stdio.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    char last_ten_digits[11] = { 0 };
    memset(&last_ten_digits[0], '0', 10);
    last_ten_digits[9] = '2';

    int temp_sum;
    int carry_val;

    for (int i = 2; i <= 7830457; i++)
    {
        carry_val = 0;

        for (int j = 9; j >= 0; j--)
        {
            temp_sum  = last_ten_digits[j] - '0' 
                      + last_ten_digits[j] - '0' 
                      + carry_val;
            carry_val = temp_sum / 10;

            last_ten_digits[j] = (temp_sum % 10) + '0';
        }
    }

    char product_term[11] = { 0 };
    memset(&product_term[0], '0', 10);

    for (int i = 9; i >= 0; i--)
    {
        int sub_product_term = 28433 * (last_ten_digits[i] - '0');

        char sub_product_term_str[10] = { 0 };
        sprintf(&sub_product_term_str[0], "%06d", sub_product_term);

        char modified_sub_product_term[11] = { 0 };
        memset(&modified_sub_product_term[0], '0', 10);

        if (i < 5)
            memcpy( &modified_sub_product_term[0], 
                    &sub_product_term_str[5-i], 
                    i + 1);
        else
            memcpy( &modified_sub_product_term[i-5], 
                    &sub_product_term_str[0], 
                    6);

        carry_val = 0;

        for (int j = 9; j >= 0; j--)
        {
            temp_sum        =  modified_sub_product_term[j] - '0' 
                            +  product_term[j] - '0' 
                            +  carry_val;
            carry_val       =  temp_sum / 10;
            product_term[j] = (temp_sum % 10) + '0';
        }
    }

    temp_sum = product_term[9] - '0' + 1;
    product_term[9] = temp_sum + '0';
    memcpy(&last_ten_digits[0], &product_term[0], 10);

    if (temp_sum == 10)
    {
        carry_val = 1;

        for (int i = 8; i >= 0; i--)
        {
            temp_sum  =  last_ten_digits[i] - '0' + carry_val;
            carry_val =  temp_sum / 10;

            last_ten_digits[i] = (temp_sum % 10) + '0';
        }
    }

    printf("%s\n", last_ten_digits);

    return 0;
}

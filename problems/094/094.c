#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

/* Topic Reference: https://www.ask-math.com/properties-of-square-numbers.html */

/* main_product = num1 * num2 */
void multiply(char main_product[21], char num1[11], char num2[11])
{
    char sub_product_1a2a[21];
    char sub_product_1a2b[21];
    char sub_product_1b2a[21];
    char sub_product_1b2b[21];

    char sub_num1[6] = { 0 };
    char sub_num2[6] = { 0 };

    long int temp_product;
    char temp_product_str[21];

    memset(&main_product[0],     '0', 21);
    memset(&sub_product_1a2a[0], '0', 21);
    memset(&sub_product_1a2b[0], '0', 21);
    memset(&sub_product_1b2a[0], '0', 21);
    memset(&sub_product_1b2b[0], '0', 21);

    main_product[20]     = 0;
    sub_product_1a2a[20] = 0;
    sub_product_1a2b[20] = 0;
    sub_product_1b2a[20] = 0;
    sub_product_1b2b[20] = 0;

    memcpy(&sub_num1[0], &num1[0], 5);
    memcpy(&sub_num2[0], &num2[0], 5);
    temp_product = atol(sub_num1) * atol(sub_num2);
    sprintf(&temp_product_str[0], "%010ld", temp_product);
    memcpy(&sub_product_1a2a[0], &temp_product_str[0], 10);

    memcpy(&sub_num2[0], &num2[5], 5);
    temp_product = atol(sub_num1) * atol(sub_num2);
    sprintf(&temp_product_str[0], "%015ld", temp_product);
    memcpy(&sub_product_1a2b[0], &temp_product_str[0], 15);

    memcpy(&sub_num1[0], &num1[5], 5);
    memcpy(&sub_num2[0], &num2[0], 5);
    temp_product = atol(sub_num1) * atol(sub_num2);
    sprintf(&temp_product_str[0], "%015ld", temp_product);
    memcpy(&sub_product_1b2a[0], &temp_product_str[0], 15);

    memcpy(&sub_num2[0], &num2[5], 5);
    temp_product = atol(sub_num1) * atol(sub_num2);
    sprintf(&temp_product_str[0], "%020ld", temp_product);
    memcpy(&sub_product_1b2b[0], &temp_product_str[0], 20);

    int carry_val = 0;

    for (int i = 19; i >= 0; i--)
    {
        int temp_sum    = sub_product_1a2a[i] - '0' 
                        + sub_product_1a2b[i] - '0' 
                        + sub_product_1b2a[i] - '0' 
                        + sub_product_1b2b[i] - '0' 
                        + carry_val;
        main_product[i] = (temp_sum % 10)  + '0';
        carry_val       =  temp_sum / 10;
    }
}

/* summation = num1 + num2 */
void add(char temp_num[21], char summation[21], char num1[21], char num2[21])
{
    memset(&temp_num[0], '0', 20);

    int carry_val = 0;

    for (int i = 19; i >= 0; i--)
    {
        int temp_sum = num1[i] - '0' 
                     + num2[i] - '0' 
                     + carry_val;

        temp_num[i]  = (temp_sum % 10)  + '0';
        carry_val    =  temp_sum / 10;
    }

    memcpy(&summation[0], &temp_num[0], 20);
    summation[20] = 0;
}

/* difference = num1 - num2 */
void subtract(char temp_num[21], char difference[21], char num1[21], char num2[21])
{
    memset(&temp_num[0], '0', 20);

    int carry_val = 0;

    for (int i = 19; i >= 0; i--)
    {
        int temp_diff = (num1[i] - '0') 
                      - (num2[i] - '0') 
                      - carry_val;

        if (temp_diff < 0)
        {
            temp_diff += 10;
            carry_val  =  1;
        }
        else
        {
            carry_val = 0;
        }

        temp_num[i] = temp_diff  + '0';
    }

    memcpy(&difference[0], &temp_num[0], 20);
    difference[20] = 0;
}

int main()
{
    char one[21]       = "00000000000000000001";
    char two[21]       = "00000000000000000002";
    char perimeter[21] = "00000000000000000000";

    char temp_num[21] = { 0 };

    char sum[21];
    memset(&sum[0], '0', 21);
    sum[20] =  0;

    char k[21];
    memset(&k[0], '0', 21);
    k[19] = '1';
    k[20] =  0;

    char n_squared[21];
    memset(&n_squared[0], '0', 21);
    n_squared[19] = '1';
    n_squared[20] =  0;

    /* Let the isoceles side = i */
    int i;

    for (i = 3; i < 150000000; i += 2)
    {
        int i_p_1_by_2 = (int)((i + 1) / 2);
        int i_m_1_by_2 = (int)((i - 1) / 2);

        int test_1 = (((i % 10) * (i % 10)) % 10)
                   - (((i_p_1_by_2 % 10) * (i_p_1_by_2 % 10)) % 10);

        if (test_1 < 0)
            test_1 += 10;

        int test_2 = (((i % 10) * (i % 10)) % 10)
                   - (((i_m_1_by_2 % 10) * (i_m_1_by_2 % 10)) % 10);

        if (test_2 < 0)
            test_2 += 10;

        int p_num_rejected = 1;
        int m_num_rejected = 1;

        /* ------------------------------------------------------------------ */
        /* I picked this up by analyzing the results.                         */
        /* This code snippet simply quickens the solve process.               */
        /* ------------------------------------------------------------------ */
        if ((test_1 == 0) || (test_1 == 1) || (test_1 == 5) || (test_1 == 6))
            p_num_rejected = 0;

        if ((test_2 == 0) || (test_2 == 1) || (test_2 == 5) || (test_2 == 6))
            m_num_rejected = 0;

        if (p_num_rejected && m_num_rejected)
            continue;
        /* ------------------------------------------------------------------ */

        char i_str[11];
        char i_str_long[21];
        char i_p_1_by_2_str[11];
        char i_m_1_by_2_str[11];

        sprintf(&i_str[0],          "%010d", i);
        sprintf(&i_str_long[0],     "%020d", i);
        sprintf(&i_p_1_by_2_str[0], "%010d", i_p_1_by_2);
        sprintf(&i_m_1_by_2_str[0], "%010d", i_m_1_by_2);

        char i_squared[21];
        char height_p_squared[21];
        char height_m_squared[21];

        multiply(i_squared, i_str, i_str);
        multiply(height_p_squared, i_p_1_by_2_str, i_p_1_by_2_str);
        multiply(height_m_squared, i_m_1_by_2_str, i_m_1_by_2_str);

        char i_squared_m_height_p_squared[21];
        char i_squared_m_height_m_squared[21];

        subtract( temp_num, 
                  i_squared_m_height_p_squared, 
                  i_squared, 
                  height_p_squared);

        subtract( temp_num, 
                  i_squared_m_height_m_squared, 
                  i_squared, 
                  height_m_squared);

        memset(&perimeter[0], '0', 20);
        add(temp_num, perimeter, perimeter, i_str_long);
        add(temp_num, perimeter, perimeter, i_str_long);
        add(temp_num, perimeter, perimeter, i_str_long);

        while (1)
        {
            if (!p_num_rejected)
            {
                if (strcmp(n_squared, i_squared_m_height_p_squared) == 0)
                {
                    add(temp_num, perimeter, perimeter, one);
                    add(temp_num, sum, sum, perimeter);
                    break;
                }
            }

            if (!m_num_rejected)
            {
                if (strcmp(n_squared, i_squared_m_height_m_squared) == 0)
                {
                    subtract(temp_num, perimeter, perimeter, one);
                    add(temp_num, sum, sum, perimeter);
                    break;
                }
            }

            if ((strcmp(n_squared, i_squared_m_height_p_squared) >= 0) 
            &&  (strcmp(n_squared, i_squared_m_height_m_squared) >= 0))
                break;

            add(temp_num, k, k, two);
            add(temp_num, n_squared, n_squared, k);
        }
    }

    memcpy(&temp_num[0], &sum[0], 20);
    for (i = 0; i < 20; i++)
        if (temp_num[i] != '0')
            break;

    memcpy(&sum[0], &temp_num[i], 20 - i);
    sum[20-i] = 0;

    printf("%s\n", sum);

    return 0;
}

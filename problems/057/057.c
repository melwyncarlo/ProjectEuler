#include <stdio.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

#define MAX_CHAR 500

int main()
{
    int n = 0;

    char a[MAX_CHAR+1] = { 0 };
    char b[MAX_CHAR+1] = { 0 };

    char a_previous[MAX_CHAR+1] = { 0 };
    char b_previous[MAX_CHAR+1] = { 0 };

    memset(&a[0], '0', MAX_CHAR);
    memset(&b[0], '0', MAX_CHAR);

    a[MAX_CHAR-1] = '3';
    b[MAX_CHAR-1] = '2';

    for (int i = 2; i <= 1000; i++)
    {
        memcpy(&a_previous[0], &a[0], MAX_CHAR);
        memcpy(&b_previous[0], &b[0], MAX_CHAR);

        int carry_val_a = 0;
        int carry_val_b = 0;

        for (int j = (MAX_CHAR - 1); j >= 0; j--)
        {
            int temp_sum_b = a_previous[j] - '0' 
                           + b_previous[j] - '0' 
                           + carry_val_b;
            carry_val_b    =  temp_sum_b / 10;
            b[j]           = (temp_sum_b % 10) + '0';

            int temp_sum_a =          b[j] - '0' 
                           + b_previous[j] - '0' 
                           + carry_val_a;
            carry_val_a    =  temp_sum_a / 10;
            a[j]           = (temp_sum_a % 10) + '0';
        }

        int a_len = 0;
        int b_len = 0;

        while (a[a_len] == '0')
            a_len++;

        while (b[b_len] == '0')
            b_len++;

        a_len = MAX_CHAR - a_len;
        b_len = MAX_CHAR - b_len;

        if (a_len > b_len)
            n++;
    }

    printf("%d\n", n);

    return 0;
}

#include <math.h>
#include <stdio.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    int sum   = 0;
    int count = 0;

    int products_list[1000] = { 0 };

    for (int i = 1; i <= 9999; i++)
    {
        char temp_str_1[10] = { 0 };
        sprintf(&temp_str_1[0], "%d", i);

        if (strchr(temp_str_1, '0') != NULL)
            continue;

        int duplicate_found = 0;
        for (int j = 0; j < (int)strlen(temp_str_1); j++)
        {
            for (int k = 0; k < (int)strlen(temp_str_1); k++)
            {
                if (j == k)
                    continue;

                if (temp_str_1[j] == temp_str_1[k])
                {
                    duplicate_found = 1;
                    break;
                }
            }

            if (duplicate_found)
                break;
        }

        if (duplicate_found)
            continue;

        for (int j = 1; j <= 9999; j++)
        {
            char temp_str_2[10] = { 0 };
            sprintf(&temp_str_2[0], "%d", j);

            if (strchr(temp_str_2, '0') != NULL)
                continue;

            duplicate_found = 0;
            for (int k = 0; k < (int)strlen(temp_str_2); k++)
            {
                for (int l = 0; l < (int)strlen(temp_str_2); l++)
                {
                    if (k == l)
                        continue;

                    if (temp_str_2[k] == temp_str_2[l])
                    {
                        duplicate_found = 1;
                        break;
                    }
                }

                if (duplicate_found)
                    break;
            }

            if (duplicate_found)
                continue;

            duplicate_found = 0;
            for (int k = 0; k < (int)strlen(temp_str_2); k++)
            {
                if (strchr(temp_str_1, temp_str_2[k]) != NULL)
                {
                    duplicate_found = 1;
                    break;
                }
            }

            if (duplicate_found)
                continue;

            int product = i * j;
            int product_length = ((int)log10(product) + 1);
            char temp_str_3[product_length+1];
            memset(&temp_str_3[0], 0, product_length + 1);
            sprintf(&temp_str_3[0], "%d", product);

            if (strchr(temp_str_3, '0') != NULL)
                continue;

            int total_length = product_length 
                             + (int)strlen(temp_str_1) 
                             + (int)strlen(temp_str_2);

            if (total_length > 9)
                break;

            if (total_length != 9)
                continue;

            duplicate_found = 0;
            for (int k = 0; k < (int)strlen(temp_str_3); k++)
            {
                for (int l = 0; l < (int)strlen(temp_str_3); l++)
                {
                    if (k == l)
                        continue;

                    if (temp_str_3[k] == temp_str_3[l])
                    {
                        duplicate_found = 1;
                        break;
                    }
                }

                if (duplicate_found)
                    break;
            }

            if (duplicate_found)
                continue;

            int duplicate_found = 0;
            for (int k = 0; k < product_length; k++)
            {
                if ((strchr(temp_str_1, temp_str_3[k]) != NULL)
                ||  (strchr(temp_str_2, temp_str_3[k]) != NULL))
                {
                    duplicate_found = 1;
                    break;
                }
            }

            if (duplicate_found)
                continue;

            products_list[count++] = product;
        }
    }

    for (int i = 0; i < count; i++)
    {
        for (int j = 0; j < count; j++)
        {
            if (i == j)
                continue;

            if (products_list[i] == products_list[j])
                products_list[j] = 0;
        }
    }

    for (int i = 0; i < count; i++)
        sum += products_list[i];

    printf("%d\n", sum);

    return 0;
}

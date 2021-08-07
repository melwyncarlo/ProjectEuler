#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    long int max_product_concat = 0;

    for (int tens = 8; tens >= 0; tens--)
    {
        for (int power = 1; power <= 4; power++)
        {
            int num = (9 * pow(10, power)) + (tens * pow(10, power - 1));
            const int max_num = num + pow(10, power - 1);
            num--;

            while (++num != max_num)
            {
                char product_concat[100] = { 0 };
                sprintf(&product_concat[0], "%d", num);

                int i = 2;
                int duplicate_found = 0;
                while (strlen(product_concat) < 9)
                {
                    int product = num * i;
                    int product_len = (int)log10(product) + 1;
                    char product_str[product_len];
                    product_str[product_len-1] = 0;
                    sprintf(&product_str[0], "%d", product);

                    if (strchr(product_str, '0'))
                        break;

                    duplicate_found = 0;
                    for (int j = 0; j < product_len; j++)
                    {
                        if (strchr(product_concat, product_str[j]) != NULL)
                        {
                            duplicate_found = 1;
                            break;
                        }
                    }

                    if ((strlen(product_concat) + product_len) > 9)
                        duplicate_found = 1;

                    if (duplicate_found)
                        break;

                    duplicate_found = 0;
                    for (int j = 0; j < product_len; j++)
                    {
                        for (int k = 0; k < product_len; k++)
                        {
                            if (j == k)
                                continue;

                            if (product_str[j] == product_str[k])
                            {
                                duplicate_found = 1;
                                break;
                            }
                        }

                        if (duplicate_found)
                            break;
                    }

                    if (duplicate_found)
                        break;

                    memcpy( &product_concat[strlen(product_concat)], 
                            &product_str[0], 
                            product_len);

                    i++;
                }

                if (!duplicate_found)
                    if (strlen(product_concat) == 9)
                        if (atol(product_concat) > max_product_concat)
                            max_product_concat = atol(product_concat);
            }
        }
    }

    printf("%ld\n", max_product_concat);

    return 0;
}

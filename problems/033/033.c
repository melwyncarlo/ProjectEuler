#include <math.h>
#include <stdio.h>
#include <stdlib.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    int count = 0;
    int products_list[4][2];

    for (int i = 10; i <= 50; i++)
    {
        for (int j = 10; j <= 99; j++)
        {
            if ((i >= j) || ((i % 10) == 0) || ((j % 10) == 0))
                continue;

            char temp_str_1[11] = { 0 };
            sprintf(&temp_str_1[0], "%d", i);

            char temp_str_2[11] = { 0 };
            sprintf(&temp_str_2[0], "%d", j);

            char temp_str_3[2] = { 0 };
            char temp_str_4[2] = { 0 };

            if ((temp_str_1[0] == temp_str_2[0])
            &&  (temp_str_1[1] != temp_str_2[1]))
            {
                temp_str_3[0] = temp_str_1[1];
                temp_str_4[0] = temp_str_2[1];
            }
            else if ((temp_str_1[0] == temp_str_2[1])
                 &&  (temp_str_1[1] != temp_str_2[0]))
            {
                temp_str_3[0] = temp_str_1[1];
                temp_str_4[0] = temp_str_2[0];
            }
            else if ((temp_str_1[1] == temp_str_2[0])
                 &&  (temp_str_1[0] != temp_str_2[1]))
            {
                temp_str_3[0] = temp_str_1[0];
                temp_str_4[0] = temp_str_2[1];
            }
            else if ((temp_str_1[1] == temp_str_2[1])
                 &&  (temp_str_1[0] != temp_str_2[0]))
            {
                temp_str_3[0] = temp_str_1[0];
                temp_str_4[0] = temp_str_2[0];
            }

            if (temp_str_3[0] != 0)
            {
                float value_1 = (int)((float)i * 100000.0 / (float)j) / 100000.0;
                float value_2 = (int)(atof(temp_str_3) * 100000.0 / atof(temp_str_4)) / 100000.0;

                if (value_1 == value_2)
                {
                    products_list[count][0] = i;
                    products_list[count][1] = j;
                    count++;
                }
            }
        }
    }

    products_list[0][0] *= products_list[1][0] * products_list[2][0] * products_list[3][0];
    products_list[0][1] *= products_list[1][1] * products_list[2][1] * products_list[3][1];

    while ((products_list[0][0] != 1) && (products_list[0][1] != 1))
    {
        int i = 2;
        int reduced = 0;
        while (!reduced)
        {
            if (((products_list[0][0] % i) == 0) && ((products_list[0][1] % i) == 0))
            {
                products_list[0][0] /= i;
                products_list[0][1] /= i;
                reduced = 1;
            }
            else
            {
                i++;
            }
        }
    }

    printf("%d\n", products_list[0][1]);

    return 0;
}

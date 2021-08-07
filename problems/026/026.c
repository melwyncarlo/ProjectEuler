#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

/* A simpler solution is to find the greatest prime number less than 1000  */
/* that is a safe prime and a full reptend.                                */

int main()
{
    int i_max = 0;
    int n     = 80;

    for (int i = 11; i < 1000; i++)
    {
        if ((i % 2) == 0)
            continue;

        if ((i % 5) == 0)
            continue;

        if ((i % 7) == 0)
            continue;

        char base_number[2001];
        memset(&base_number[0], '0', 2000);
        base_number[2000] = 0;
        base_number[0] = '1';

        int carry_val = 0;
        for (int j = 0; j < 2000; j += 10)
        {
            char base_sub_number[14] = { 0 };
            sprintf(&base_sub_number[0], "%03d", carry_val);
            memcpy(&base_sub_number[3], &base_number[j], 10);
            long int quotient = (long int)(atol(base_sub_number) / i);
            carry_val = atol(base_sub_number) % i;

            sprintf(&base_sub_number[0], "%010lu", quotient);
            memcpy(&base_number[j], &base_sub_number[0], 10);

        }

        int j = 0;
        while (base_number[j] == '0')
            j++;

        int find_length = n;

        while (j <= (2000 - find_length))
        {
            char temp_sub_str_001[find_length+1];
            temp_sub_str_001[find_length] = 0;
            memcpy(&temp_sub_str_001[0], &base_number[j], find_length);

            char temp_sub_str_002[2001-find_length-j];
            temp_sub_str_002[2000-find_length-j] = 0;
            memcpy(&temp_sub_str_002[0], &base_number[j+find_length], 2000 - find_length - j);

            if (strstr(temp_sub_str_002, temp_sub_str_001) != NULL)
            {
                const int DIGITS_LEN = 10;

                char temp_sub_str_01[DIGITS_LEN+1];
                temp_sub_str_01[DIGITS_LEN] = 0;
                memcpy(&temp_sub_str_01[0], &temp_sub_str_001[0], DIGITS_LEN);

                char temp_sub_str_02[find_length-DIGITS_LEN+1];
                temp_sub_str_02[find_length-DIGITS_LEN] = 0;
                memcpy(&temp_sub_str_02[0], &temp_sub_str_001[DIGITS_LEN], find_length - DIGITS_LEN);

                if (strstr(temp_sub_str_02,  temp_sub_str_01) == NULL)
                {
                    n = find_length++;

                    if ((strstr(temp_sub_str_002, temp_sub_str_001) - temp_sub_str_002) == 0)
                    {
                        i_max = i;
                        break;
                    }
                    else
                    {
                        continue;
                    }
                }
            }

            j++;
        }
    }

    printf("%d\n", i_max);

    return 0;
}

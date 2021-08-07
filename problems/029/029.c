#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    int sum = 0;

    FILE *fp;
    const char* FILE_NAME = "problems/029/temp.dat";
    remove(FILE_NAME);
    fp = fopen(FILE_NAME, "w+");

    for (int i = 2; i <= 100; i++)
    {
        char n_str[200];
        sprintf(&n_str[0], "%02d", i);

        int str_length = 2;

        char products_array[200][200];

        for (int j = 2; j <= 100; j++)
        {
            for (int m = (str_length - 1); m >= 0; m--)
            {
                char temp_product[3+1];
                const char temp_char[2] = { n_str[m] };
                sprintf(temp_product, "%03d", i * atoi(temp_char));

                for (int k1 = 0; k1 < (m + 1); k1++)
                    products_array[m][k1] = '0';

                for (int k2 = (m + 1); k2 < (m + 4); k2++)
                    products_array[m][k2] = temp_product[k2-m-1];

                for (int k3 = (m + 4); k3 < (str_length + 3); k3++)
                    products_array[m][k3] = '0';
            }

            memset(n_str, 0, sizeof(n_str));

            n_str[str_length + 3 - 2] = '0';

            for (int m = (str_length + 3 - 1); m > 0; m--)
            {
                int temp_sum = 0;
                for (int n = 0; n < str_length; n++)
                    temp_sum += products_array[n][m] - '0';

                temp_sum  += n_str[m-1] - '0';
                n_str[m-1] = ((temp_sum % 10) + '0');
                n_str[m-2] = ((int)(temp_sum / 10) + '0');
            }

            str_length += 2;

            char n_str_copy[200];
            memset(n_str_copy, '0', sizeof(n_str_copy));
            n_str_copy[199] = 0;

            memcpy(&n_str_copy[200-str_length], &n_str[0], str_length);

            char line[201];
            int  duplicate_found = 0;
            fseek(fp, 0, SEEK_SET);
            while (fgets(line, sizeof(line), fp) != NULL)
            {
                if (strcmp(line, n_str_copy) == 0)
                {
                    duplicate_found = 1;
                    break;
                }
            }

            if (!duplicate_found)
            {
                fseek(fp, 0, SEEK_END);
                fprintf(fp, "%s", n_str_copy);
            }
        }
    }

    char line[201];
    fseek(fp, 0, SEEK_SET);
    while (fgets(line, sizeof(line), fp))
        sum++;

    fclose(fp);
    remove(FILE_NAME);

    printf("%d\n", sum);

    return 0;
}

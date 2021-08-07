#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    int TRIANGLE[100][100];

    int i = 0;

    FILE *fp;
    char triangle_num_row[301] = { 0 };
    const char* FILE_NAME = "problems/067/p067_triangle.txt";
    fp = fopen(FILE_NAME, "r");

    while (fgets(triangle_num_row, 301, fp) != NULL)
    {
        char triangle_num[3] = { 0 };

        int j        = 0;
        int digits_n = 0;

        for (int digits_i = 0; digits_i < (int)strlen(triangle_num_row); digits_i++)
        {
            if (digits_n <= 1)
            {
                triangle_num[digits_n++] = triangle_num_row[digits_i];
            }
            else
            {
                TRIANGLE[i][j++] = atoi(triangle_num);
                digits_n = 0;
            }
        }

        if (j < 100)
        {
            while (j != 100)
            {
                TRIANGLE[i][j++] = 0;
            }
        }

        i++;
    }

    fclose(fp);

    for (int i = 98; i >= 0; i--)
    {
        for (int j = 0; j <= i; j++)
        {
            if (TRIANGLE[i+1][j] >= TRIANGLE[i+1][j+1])
                TRIANGLE[i][j] += TRIANGLE[i+1][j];
            else
                TRIANGLE[i][j] += TRIANGLE[i+1][j+1];
        }
    }

    printf("%d\n", TRIANGLE[0][0]);

    return 0;
}

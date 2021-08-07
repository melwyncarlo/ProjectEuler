#include <stdio.h>
#include <ctype.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    int sudoku[50][9][9];

    int sum = 0;

    FILE *fp;
    char num_str[10];
    const char* FILE_NAME = "problems/096/p096_sudoku.txt";
    fp = fopen(FILE_NAME, "r");

    int index    = -1;
    int subindex =  0;

    while (fgets(num_str, 10, fp) != NULL)
    {
        if (isalpha(num_str[0]))
        {
            subindex = 0;
            index++;
            continue;
        }

        if (isdigit(num_str[0]))
        {
            int row_data[9];
            for (int i = 0; i < 9; i++)
                row_data[i] = num_str[i] - '0';
            memcpy(&sudoku[index][subindex++][0], &row_data[0], 9 * sizeof(int));
        }
    }

    for (int puzzle = 0; puzzle < 50; puzzle++)
    {
        int is_fixed_cell[9][9] = { 0 };

        for (int i = 0; i < 9; i++)
            for (int j = 0; j < 9; j++)
                if (sudoku[puzzle][i][j])
                    is_fixed_cell[i][j] = 1;

        int digit[9][9][10] = { 0 };

        int i = 0;
        while (i < 9)
        {
            int j = 0;
            while (j < 9)
            {
                if (is_fixed_cell[i][j])
                {
                    j++;
                    continue;
                }

                int i2 = (int)(i / 3) * 3;
                int j2 = (int)(j / 3) * 3;

                int duplicate_found = 1;

                if (!digit[i][j][1] || !digit[i][j][2] || !digit[i][j][3] 
                ||  !digit[i][j][4] || !digit[i][j][5] || !digit[i][j][6] 
                ||  !digit[i][j][7] || !digit[i][j][8] || !digit[i][j][9])
                {
                    for (int k = 1; k <= 9; k++)
                    {
                        if (digit[i][j][k])
                            continue;

                        duplicate_found = 0;

                        for (int l = 0; l < 9; l++)
                        {
                            if (l != i)
                            {
                                if (sudoku[puzzle][l][j] == k)
                                {
                                    duplicate_found = 1;
                                    break;
                                }
                            }

                            if (l != j)
                            {
                                if (sudoku[puzzle][i][l] == k)
                                {
                                    duplicate_found = 1;
                                    break;
                                }
                            }
                        }

                        if (!duplicate_found)
                        {
                            if ((sudoku[puzzle][i2][j2]     == k) || (sudoku[puzzle][i2][j2+1]   == k) 
                            ||  (sudoku[puzzle][i2][j2+2]   == k) || (sudoku[puzzle][i2+1][j2]   == k) 
                            ||  (sudoku[puzzle][i2+1][j2+1] == k) || (sudoku[puzzle][i2+1][j2+2] == k) 
                            ||  (sudoku[puzzle][i2+2][j2]   == k) || (sudoku[puzzle][i2+2][j2+1] == k) 
                            ||  (sudoku[puzzle][i2+2][j2+2] == k)) 
                                duplicate_found = 1;
                        }

                        if (!duplicate_found)
                        {
                            digit[i][j][k] = 1;
                            sudoku[puzzle][i][j] = k;
                            break;
                        }
                    }
                }

                if (duplicate_found)
                {
                    memset(&digit[i][j][0], 0, 10 * sizeof(int));

                    sudoku[puzzle][i][j] = 0;

                    j--;
                    if (j < 0)
                    {
                        j = 8;
                        i--;
                    }
                    while (is_fixed_cell[i][j])
                    {
                        j--;
                        if (j < 0)
                        {
                            j = 8;
                            i--;
                        }
                    }
                }
                else
                {
                    j++;
                }
            }

            i++;
        }

        sum += ( (sudoku[puzzle][0][0] * 100) 
            +    (sudoku[puzzle][0][1] *  10) 
            +     sudoku[puzzle][0][2]);
    }

    printf("%d\n", sum);

    return 0;
}

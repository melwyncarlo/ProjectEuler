#include <stdio.h>
#include <stdlib.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    const int N = 1001;

    int spiral_array[N][N];

    int i = (int)(N / 2);
    int j = (int)(N / 2);

    int sum       = 0;
    int count     = 2;
    int move_val  = 1;
    int go_right  = 1;
    int right_val = 1;
    int down_val  = 1;

    spiral_array[i][j] = 1;

    while ((i > 0) || (j < N))
    {
        if (go_right)
        {
            for (int k = 1; k <= move_val; k++)
            {
                j += right_val;
                spiral_array[i][j] = count;
                count++;
            }

            right_val *= -1;
            go_right   =  0;
        }
        else
        {
            for (int k = 1; k <= move_val; k++)
            {
                i += down_val;
                spiral_array[i][j] = count;
                count++;
            }

            move_val++;
            down_val *= -1;
            go_right  =  1;
        }
    }

    for (i = 0; i < N; i++)
        sum += spiral_array[i][i] + spiral_array[N-i-1][i];
    sum -= spiral_array[(int)(N / 2)][(int)(N / 2)];

    printf("%d\n", sum);

    return 0;
}

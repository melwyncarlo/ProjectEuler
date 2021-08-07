#include <math.h>
#include <stdio.h>
#include <stdlib.h>

/* Copyright 2021 Melwyn Francis Carlo */

#define MAX_E 7 /* 1E+x */

int main()
{
    int product = 1;

    const int N[MAX_E] = { 1, 10, 100, 1000, 10000, 100000, 1000000 };

    int INDICES[MAX_E];

    INDICES[0] = 1;

    for (int i = 1; i < MAX_E; i++)
        INDICES[i] = INDICES[i-1] + (9 * i * pow(10, i - 1));

    for (int i = 0; i < MAX_E; i++)
    {
        int j = 0;
        for (j = 0; j < MAX_E; j++)
            if (N[i] < INDICES[j])
                break;
        j--;

        int num = pow(10, j) + (int)((N[i] - INDICES[j]) / (j + 1));

        char num_str[j+2];
        num_str[j+1] = 0;
        sprintf(&num_str[0], "%d", num);

        char num_char[2] = { num_str[(N[i]-INDICES[j])%(j+1)] };

        product *= atoi(num_char);
    }

    printf("%d\n", product);

    return 0;
}

#include <stdio.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

#define N_MAX 10

int main()
{
    const int i = 1E6;
    int numbers[N_MAX] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };

    long int MAX_PERMUTATION = 1;
    for (int j = 2; j <= N_MAX; j++)
        MAX_PERMUTATION *= j;

    int n = N_MAX;
    long int n_product = N_MAX;

    char digits[N_MAX+1];

    int index  = (int)( (i - 1) * n_product / MAX_PERMUTATION );
    digits[0]  = numbers[index] + '0';

    for (int j = 1; j < N_MAX; j++)
    {
        n--;
        n_product *= n;

        if (index < (N_MAX - 1))
            memmove( &numbers[index], 
                     &numbers[index+1], 
                     (N_MAX - index - 1) * sizeof(int));

        index = (int)( (i - 1) * n_product / MAX_PERMUTATION ) % n;

        digits[j] = numbers[index] + '0';
    }

    printf("%s\n", digits);

    return 0;
}

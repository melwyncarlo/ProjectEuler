#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

#define N 7E8

int main()
{
    int side_length = 1;

    // Using the algorithm of Sieve of Eratosthenes
    int *marked = (int*)calloc(N+1, sizeof(int));
    for (int i = 2; (i*i) <= N; i++)
    {
        if (!marked[i])
        {
            for (int j = (i*i); j <= N; j += i)
                marked[j] = 1;
        }
    }

    int num      = 1;
    int primes_n = 0;

    while (1)
    {
        side_length += 2;

        for (int side = 1; side <= 3; side++)
        {
            num += side_length - 1;

            if (!marked[num])
                primes_n++;
        }

        num += side_length - 1;

        double ratio_percentage = (double)primes_n 
                                / (double)(side_length + side_length - 1);

        if (ratio_percentage < 0.1)
            break;
    }

    free(marked);

    printf("%d\n", side_length);

    return 0;
}

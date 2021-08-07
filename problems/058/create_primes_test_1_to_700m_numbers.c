#include <stdio.h>
#include <stdlib.h>

/* Copyright 2021 Melwyn Francis Carlo */

#define N 7E8+1

int main()
{
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
    marked[1] = 1;

    FILE *fp;

    fp = fopen("Prime_Numbers_Test_for_First_700_Million_Natural_Numbers", "w+");

    for (int i = 1; i < N; i++)
    {
        if (!marked[i])
            fprintf(fp, "1");
        else
            fprintf(fp, "0");
    }

    fprintf(fp, "\n");

    fclose(fp);

    free(marked);

    return 0;
}

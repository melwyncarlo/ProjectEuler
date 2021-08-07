#include <math.h>
#include <stdio.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    long int tn;

    const int MAX_N = 1E5;

    for (int i = 286; i <= MAX_N; i++)
    {
        tn = 0.5 * i * (i + 1);

        double sqrt_term = sqrt(1 + (24 * tn));

        if (sqrt_term != (long int)sqrt_term)
            continue;

        if ((((long int)sqrt_term + 1) % 6) != 0)
            continue;

        sqrt_term = sqrt(1 + (8 * tn));

        if (sqrt_term != (long int)sqrt_term)
            continue;

        if ((((long int)sqrt_term + 1) % 4) == 0)
            break;
    }

    printf("%ld\n", tn);

    return 0;
}

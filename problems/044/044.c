#include <math.h>
#include <stdio.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    int min_pd = 1E7;

    const int MAX_N = 5E3;

    for (int i = 1; i <= MAX_N; i++)
    {
        int p1 = 0.5 * i * ((3 * i) - 1);

        for (int j = (i + 1); j <= MAX_N; j++)
        {
            int p2 = 0.5 * j * ((3 * j) - 1);

            int p1pp2 = p1 + p2;

            float sqrt_term = sqrt(1 + (24 * p1pp2));

            if (sqrt_term != (int)sqrt_term)
                continue;

            if ((((int)sqrt_term + 1) % 6) != 0)
                continue;

            int p1mp2 = p2 - p1;

            sqrt_term = sqrt(1 + (24 * p1mp2));

            if (sqrt_term != (int)sqrt_term)
                continue;

            if ((((int)sqrt_term + 1) % 6) == 0)
                if (p1mp2 < min_pd)
                    min_pd = p1mp2;
        }
    }

    printf("%d\n", min_pd);

    return 0;
}

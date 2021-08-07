#include <stdio.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    int p_max_solutions = 0;
    int n_max_solutions = 0;

    for (int p = 1000; p > 500; p--)
    {
        int b = 0;
        int n = 0;
        while (1)
        {
            if (++b == (p / 2))
                break;

            float p2 = (float)p;
            float b2 = (float)b;

            float a = ((p2 * p2) - (2 * p2 * b2)) / ((2 * p2) - (2 * b2));

            if ((int)(a) == a)
                n++;
        }

        if (n > n_max_solutions)
        {
            n_max_solutions = n;
            p_max_solutions = p;
        }
    }

    printf("%d\n", p_max_solutions);

    return 0;
}

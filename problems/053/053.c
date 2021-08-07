#include <stdio.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    int n_values = 0;

    for (int n = 23; n <= 100; n++)
    {
        for (int r = 2; r <= (n / 2); r++)
        {
            int numerator_factorial_start   = n;
            int numerator_factorial_end     = ((n - r) + 1);

            double denominator = (double)r;

            double combination = 1.0;
            for (int i = numerator_factorial_start; i >= numerator_factorial_end; i--)
            {
                double numerator = (double)i;

                if (denominator != 1.0)
                    combination *= numerator / denominator;
                else
                    combination *= numerator;

                denominator--;
            }

            if (combination > 1.0E6)
            {
                n_values += ((int)(n / 2) - r + 1) * 2;
                n_values -= !(n % 2);
                break;
            }
        }
    }

    printf("%d\n", n_values);

    return 0;
}

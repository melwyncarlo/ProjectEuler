#include <stdio.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    /* The first element is a dummy element. */
    const int MONTH_CONSTANT[13] = { 0, 1, -1, 0, 0, 1, 1, 2, 3, 3, 4, 4, 5 };

    int n = 0;

    for (int i = 1901; i <= 2000; i++)
    {
        for (int j = 1; j <= 12; j++)
        {
            int day_val = ( (365 * (i - 1))  + (int)((i - 1) / 400) 
                        + (int)((i - 1) / 4) - (int)((i - 1) / 100) 
                        + (30 * (j - 1)) + MONTH_CONSTANT[j-1] + 1  );

            if (((i % 4) == 0) && (j > 2))
                day_val++;

            day_val %= 7;

            if (day_val == 0)
                n++;
        }
    }

    printf("%d\n", n);

    return 0;
}

#include <math.h>
#include <stdio.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    int n = 0;

    const int AND_STR_LENGTH          = 3;
    const int HUNDRED_STR_LENGTH      = 7;
    const int ONE_THOUSAND_STR_LENGTH = 11;

    /* The first elements are dummy elements. */
    const int ONES_STR_LENGTH[10]    = { 0, 3, 3, 5, 4, 4, 3, 5, 5, 4 };
    const int TENS_STR_LENGTH[10]    = { 0, 3, 6, 6, 5, 5, 5, 7, 6, 6 };
    const int ELEVENS_STR_LENGTH[10] = { 0, 6, 6, 8, 8, 7, 7, 9, 8, 8 };

    for (int i = 1; i <= 999; i++)
    {
        int number_length = (int)log10(i) + 1;
        int ones_number = i % 10;
        int tens_number = (int)(i / 10) % 10;

        if (number_length > 2)
        {
            n += ONES_STR_LENGTH[(int)(i / 100)] 
               + HUNDRED_STR_LENGTH;

            if ((ones_number > 0) || (tens_number > 0))
                n += AND_STR_LENGTH;
        }

        if (number_length > 1)
        {
            if (tens_number == 1)
            {
                if (ones_number == 0)
                    n += TENS_STR_LENGTH[1];
                else
                    n += ELEVENS_STR_LENGTH[ones_number];

                continue;
            }
            else
            {
                n += TENS_STR_LENGTH[tens_number];
            }
        }

        n += ONES_STR_LENGTH[ones_number];
    }

    n += ONE_THOUSAND_STR_LENGTH;

    printf("%d\n", n);

    return 0;
}

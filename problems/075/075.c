#include <stdio.h>
#include <stdlib.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    int number_of_exactly_one_right_triangle = 0;

    int *perimeters = (int*)calloc(1500001, sizeof(int));

    int m = 2;
    int n = 0;

    for (m = 2; n != 1; m++)
    {
        for (n = 1; m > n; n++)
        {
            if (((m + n) % 2) != 1)
                continue;

            int temp_val_1 = m;
            int temp_val_2 = n;
            while (temp_val_2)
            {
                int swap_val = temp_val_1 % temp_val_2;
                temp_val_1 = temp_val_2;
                temp_val_2 = swap_val;
            }

            if (temp_val_1 != 1)
                continue;

            int a = (m * m) - (n * n);
            int b = 2 * m * n;
            int c = (m * m) + (n * n);

            int perimeter = a + b + c;

            if (perimeter > 1500000)
                break;

            int perimeter_multiple = 0;

            while ((perimeter_multiple += perimeter) <= 1500000)
                perimeters[perimeter_multiple]++;
        }
    }

    for (int i = 1; i <= 1500000; i++)
        if (perimeters[i] == 1)
            number_of_exactly_one_right_triangle++;

    printf("%d\n", number_of_exactly_one_right_triangle);

    return 0;
}

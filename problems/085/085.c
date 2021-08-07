#include <math.h>
#include <stdio.h>
#include <stdlib.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    int solution_area          = 0;
    int rectangles_discrepancy = 2000000;

    int rows = 1;

    while (1)
    {
        float sqrt_sub_term = 4 * (8000000.0 / (rows * (rows + 1.0)));
        float sqrt_term     = sqrt(1.0 + sqrt_sub_term);

        int cols = (int)((sqrt_term - 1.0) / 2.0);

        if (rows > cols)
            break;

        while (1)
        {
            int total_rectangles = ((rows * (rows + 1) / 2)
                                 *  (cols * (cols + 1) / 2));

            if (abs(2000000 - total_rectangles) < rectangles_discrepancy)
            {
                rectangles_discrepancy = abs(2000000 - total_rectangles);
                solution_area = rows * cols;
            }

            if (total_rectangles > 210000)
                break;

            cols++;
        }

        rows++;
    }

    printf("%d\n", solution_area);

    return 0;
}

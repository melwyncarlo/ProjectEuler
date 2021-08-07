#include <stdio.h>

/* Copyright 2021 Melwyn Francis Carlo */

# define SQUARE_GRID_DIMENSIONS 50

int main()
{
    int n = 0;

    for (int i1 = 0; i1 <= SQUARE_GRID_DIMENSIONS; i1++)
    {
        for (int j1 = 1; j1 <= SQUARE_GRID_DIMENSIONS; j1++)
        {
            for (int i2 = 0; i2 <= SQUARE_GRID_DIMENSIONS; i2++)
            {
                for (int j2 = 0; j2 <= SQUARE_GRID_DIMENSIONS; j2++)
                {
                    if ((i2 == 0) && (j2 == 0))
                        continue;

                    if ((i1 == i2) && (j1 == j2))
                        continue;

                    if (i2 < i1)
                        if (j2 >= ((j1/i1)*i2))
                            continue;

                    int side1 =  (i1 * i1) + (j1 * j1);
                    int side2 =  (i2 * i2) + (j2 * j2);
                    int side3 = ((i2 - i1) * (i2 - i1)) 
                              + ((j2 - j1) * (j2 - j1));

                    if (((side1 + side2) == side3) 
                    ||  ((side2 + side3) == side1) 
                    ||  ((side1 + side3) == side2)) n++;
                    
                }
            }
        }
    }

    printf("%d\n", n);

    return 0;
}

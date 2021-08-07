#include <math.h>
#include <stdio.h>

/* Copyright 2021 Melwyn Francis Carlo */

# define INFINITY_NUM 999.0
# define TOLERANCE 1.0E7

int main()
{
    const int square_grid_dimensions = 50;

    int n = 0;

    for (int i1 = 1; i1 < square_grid_dimensions; i1++)
    {
        for (int j1 = 1; j1 < square_grid_dimensions; j1++)
        {
            for (int i2 = (i1 + 1); i2 < square_grid_dimensions; i2++)
            {
                for (int j2 = 1; j2 < j1; j2++)
                {//printf("%d, %d  &  %d, %d :  ", i1, j1, i2, j2);
                    //if ((i2 < i1))
                    //    continue;

                    if ((i2 == 0) || (j1 == 0))
                        continue;

                    if ((i1 == 0) && ((j2 == 0) || (j2 == j1)))
                        continue;

                    if ((j2 == 0) && (i2 == i1))
                        continue;

                    /*if ((i2 < i1) && (j2 >= j1))
                        continue;*/

                    if ((i1 == 0) && (i2 == 0))
                        continue;

                    if ((j1 == 0) && (j2 == 0))
                        continue;

                    double slope1 = (double) i1;
                    double slope2 = (double)(i2 - i1);
                    double slope3 = (double) i2;

                    if (slope1 == 0.0)
                        continue;
                    else
                        slope1 = (int)(((double)j1 / (double)slope1) * TOLERANCE) / TOLERANCE;

                    if (slope2 == 0.0)
                        continue;
                    else
                        slope2 = (int)(((double)(j2 - j1) / (double)slope2) * TOLERANCE) / TOLERANCE;

                    if (slope3 == 0.0)
                        continue;
                    else
                        slope3 = (int)(((double)j2 / (double)slope3) * TOLERANCE) / TOLERANCE;
if ((i2 <= i1) && (j2 >= (i2 * slope1)))
                        continue;

                    if (slope1 == 0.0)
                        continue;

                    if (slope2 == 0.0)
                        continue;

                    if (slope3 == 0.0)
                        continue;

                    if ((slope1 == slope2) || (slope2 == slope3) || (slope1 == slope3))
                    continue;
                    double slope12 = slope1 * slope2;
                    double slope23 = slope2 * slope3;
                    double slope13 = slope1 * slope3;

                    if ( (((slope12) < 0.0) && ((int)(fabs(slope12) * TOLERANCE) / TOLERANCE) == 1.0) 
                    ||  (((slope23) < 0.0) && ((int)(fabs(slope23) * TOLERANCE) / TOLERANCE) == 1.0) 
                    ||  (((slope13) < 0.0) && ((int)(fabs(slope13) * TOLERANCE) / TOLERANCE) == 1.0) ){printf("4.  %d, %d  &  %d, %d  =  %lf\n", i1, j1, i2, j2, slope1);
                        n++;}
                }
            }
        }
    }
// 2742
    printf("%d\n", n);

    return 0;
}

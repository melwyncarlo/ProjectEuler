#include <math.h>
#include <stdio.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    const int input_grid_dimension = 20;

    double routes_n = 1;

    for (int i = 1; i <= input_grid_dimension; i++)
        routes_n *= ((double)(i + input_grid_dimension) / i);

    printf("%ld\n", (long int)ceil(routes_n));

    return 0;
}

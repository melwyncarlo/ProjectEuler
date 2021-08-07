#include <stdio.h>
#include <math.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    int val_1a = floor((1000-1) / 3);
    int val_1b = 3 * ((val_1a * (val_1a + 1)) / 2);
    int val_2a = floor((1000-1) / 5);
    int val_2b = 5 * ((val_2a * (val_2a + 1)) / 2);
    int val_3a = floor((1000-1) / 15);
    int val_3b = 15 * ((val_3a * (val_3a + 1)) / 2);

    printf("%d\n", val_1b + val_2b - val_3b);

    return 0;
}

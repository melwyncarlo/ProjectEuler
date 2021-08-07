#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    int combinations = 0;

    for (int i = 0; i <= 200; i += 200)
        for (int j = 0; j <= 200; j += 100)
            for (int k = 0; k <= 200; k += 50)
                for (int l = 0; l <= 200; l += 20)
                    for (int m = 0; m <= 200; m += 10)
                        for (int n = 0; n <= 200; n += 5)
                            for (int o = 0; o <= 200; o += 2)
                                for (int p = 0; p <= 200; p += 1)
                                    if ((i + j + k + l + m + n + o + p) == 200)
                                        combinations++;

    printf("%d\n", combinations);

    return 0;
}

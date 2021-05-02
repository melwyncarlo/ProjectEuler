#include <stdio.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main() {
    int a = 1;
    while (1) {
        double b = (5E+5 - (1E+3 * a)) / (1E+3 - a);
        if ( ((b - (int)b) == 0) && (b > a) ) {
            int c = 1000 - a - b;
            if (b < c) {
                int product = a * b * c;
                printf("\n%d\n\n", product);
                break;
            }
        }
        a += 1;
        if (a == 1000)
            a += 1;
    }
    return 0;
}

#include <stdio.h>
#include <string.h>
#include <math.h>

/* Copyright 2021 Melwyn Francis Carlo */

char *strrev(char *str)
{
        char *p1, *p2;
        if (! str || ! *str)
            return str;
        for (p1 = str, p2 = str + strlen(str) - 1; p2 > p1; ++p1, --p2)
        {
            *p1 ^= *p2;
            *p2 ^= *p1;
            *p1 ^= *p2;
        }
        return str;
}

int is_palindrome(int n_val) {
    char n_str[7], n_str_split_1[4], n_str_split_2[4];
    sprintf(n_str, "%d", n_val);
    sprintf(n_str_split_1, "%.*s", (int)(ceil)(strlen(n_str)/2), n_str + 0);
    sprintf(n_str_split_2, "%.*s", (int)(ceil)(strlen(n_str)/2), n_str 
        + (int)(floor)(strlen(n_str)/2));
    strrev((char*)n_str_split_2);
    if (strcmp(n_str_split_1, n_str_split_2) == 0) {
        return 1;
    } else {
        return 0;
    }
}

int main() {
    for (int i = 999; i >= 900; i--) {
        for (int j = 999; j >= 900; j--) {
            int n = i * j;
            if (is_palindrome(n) == 1) {
                printf("\n%d\n\n", n);
                return 0;
            }
        }
    }
    return 0;
}

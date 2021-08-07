#include <stdio.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    int i_count = 0;

    for (int i = 2; i < 10000000; i++)
    {
        int chain = i;

        while (1)
        {
            char chain_str[9] = { 0 };
            sprintf(&chain_str[0], "%d", chain);

            int sum = 0;
            for (int j = 0; j < (int)strlen(chain_str); j++)
                sum += ((chain_str[j] - '0') * (chain_str[j] - '0'));

            if (sum == 1)
                break;

            if (sum == 10)
                break;

            if (sum == 13)
                break;

            if (sum == 31)
                break;

            if (sum == 23)
                break;

            if (sum == 32)
                break;

            if (sum == 44)
                break;

            if (sum == 89)
            {
                i_count++;
                break;
            }

            if (sum == 98)
            {
                i_count++;
                break;
            }

            if (sum == 85)
            {
                i_count++;
                break;
            }

            if (sum == 58)
            {
                i_count++;
                break;
            }

            if (sum == 4)
            {
                i_count++;
                break;
            }

            if (sum == 16)
            {
                i_count++;
                break;
            }

            if (sum == 61)
            {
                i_count++;
                break;
            }

            if (sum == 2)
            {
                i_count++;
                break;
            }

            if (sum == 20)
            {
                i_count++;
                break;
            }

            if (sum == 37)
            {
                i_count++;
                break;
            }

            if (sum == 73)
            {
                i_count++;
                break;
            }

            if (sum == 42)
            {
                i_count++;
                break;
            }

            if (sum == 24)
            {
                i_count++;
                break;
            }

            if (sum == 145)
            {
                i_count++;
                break;
            }

            if (sum == 154)
            {
                i_count++;
                break;
            }

            if (sum == 451)
            {
                i_count++;
                break;
            }

            if (sum == 415)
            {
                i_count++;
                break;
            }

            if (sum == 514)
            {
                i_count++;
                break;
            }

            if (sum == 541)
            {
                i_count++;
                break;
            }

            chain = sum;
        }
    }

    printf("%d\n", i_count);

    return 0;
}

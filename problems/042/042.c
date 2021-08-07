#include <math.h>
#include <stdio.h>
#include <ctype.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    FILE *fp;
    char* filename = "problems/042/p042_words.txt";
    fp = fopen(filename, "r");

    char ch;
    int  count    =  0;
    int  index    = -1;
    int  word_val =  0;
    int  is_incremented = 0;

    fseek(fp, 1, SEEK_SET);
    while((ch = fgetc(fp)) != EOF)
    {
        if (isalpha(ch))
        {
            is_incremented = 0;
            word_val += ch - 64;
            index++;
        }
        else
        {
            if (!is_incremented)
            {
                index = 0;
                is_incremented = 1;

                float sqrt_term = sqrt(1 + (8 * word_val));
                word_val = 0;

                if (sqrt_term != (int)sqrt_term)
                    continue;

                float n_term = (sqrt_term - 1) / 2;

                if (n_term != (int)n_term)
                    continue;

                count++;
            }
        }
    }

    fclose(fp);

    printf("%d\n", count);

    return 0;
}

#include <stdio.h>
#include <ctype.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo 871198282*/

int main()
{
    char name[50];
    char names_list[5500][50];

    memset(names_list, 0, sizeof(names_list));

    FILE *fp;
    char* filename = "problems/022/p022_names.txt";
    fp = fopen(filename, "r");
    fseek(fp, 1, 1);

    char ch;
    int  index = 0;
    int  count = 0;
    int  is_incremented = 0;

    while((ch = fgetc(fp)) != EOF)
    {
        if (isalpha(ch))
        {
            is_incremented = 0;
            name[index++] = ch;
        }
        else
        {
            if (!is_incremented)
            {
                index = 0;
                is_incremented = 1;

                strcpy(&names_list[count++][0], name);

                memset(name, 0, sizeof(name));
            }
        }
    }

    fclose(fp);

    for (int i = 0; i < (count - 1); i++)
    {
        for (int j = (i + 1); j < count; j++)
        {
            if (strcmp(names_list[i], names_list[j]) > 0)
            {
                memset(name, 0, sizeof(name));
                strcpy(name, names_list[i]);
                strcpy(names_list[i], names_list[j]);
                strcpy(names_list[j], name);
            }
        }
    }

    int n = 0;

    for (int i = 0; i < count; i++)
    {
        int alpha_val = 0;

        for (int j = 0; j < (int)strlen(names_list[i]); j++)
            alpha_val += names_list[i][j] - 64;

        n += ((i + 1) * alpha_val);
    }

    printf("%d\n", n);

    return 0;
}

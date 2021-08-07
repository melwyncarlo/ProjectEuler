#include <stdio.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    FILE *fp;
    char passcode_attempt_str[5];
    const char* FILE_NAME = "problems/079/p079_keylog.txt";

    fp = fopen(FILE_NAME, "r");

    int index = 0;

    char passcode[11];

    int passcode_positions[10] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };

    while (fgets(passcode_attempt_str, 5, fp) != NULL)
    {
        int digit_1 = passcode_attempt_str[0] - '0';
        int digit_2 = passcode_attempt_str[1] - '0';
        int digit_3 = passcode_attempt_str[2] - '0';

        if (passcode_positions[digit_1] >= passcode_positions[digit_2])
        {
            int swap_val = passcode_positions[digit_1];
            passcode_positions[digit_1]  = passcode_positions[digit_2];
            passcode_positions[digit_2]  = swap_val;
        }

        if (passcode_positions[digit_2] >= passcode_positions[digit_3])
        {
            int swap_val = passcode_positions[digit_2];
            passcode_positions[digit_2]  = passcode_positions[digit_3];
            passcode_positions[digit_3]  = swap_val;
        }
    }

    fclose(fp);

    for (int i = 0; i < 10; i++)
    {
        if (passcode_positions[i] == (i + 1))
            continue;

        for (int j = 0; j < 10; j++)
        {
            if (passcode_positions[j] == (i + 1))
            {
                passcode[index++] = j + '0';
                break;
            }
        }
    }

    printf("%s\n", passcode);

    return 0;
}

#include <stdio.h>
#include <stdlib.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    char main_num[11] = "0123456789";

    long int sum = 0;
    long int pandigital_num_list[100] = { 0 };

    int count = 0;

    char temp_char;
    for (int i = 0; i < 10; i++)
    {
        temp_char   = main_num[9];
        main_num[9] = main_num[8];
        main_num[8] = main_num[7];
        main_num[7] = main_num[6];
        main_num[6] = main_num[5];
        main_num[5] = main_num[4];
        main_num[4] = main_num[3];
        main_num[3] = main_num[2];
        main_num[2] = main_num[1];
        main_num[1] = main_num[0];
        main_num[0] = temp_char;

        for (int j = 0; j < 9; j++)
        {
            temp_char   = main_num[9];
            main_num[9] = main_num[8];
            main_num[8] = main_num[7];
            main_num[7] = main_num[6];
            main_num[6] = main_num[5];
            main_num[5] = main_num[4];
            main_num[4] = main_num[3];
            main_num[3] = main_num[2];
            main_num[2] = main_num[1];
            main_num[1] = temp_char;

            for (int k = 0; k < 8; k++)
            {
                temp_char   = main_num[9];
                main_num[9] = main_num[8];
                main_num[8] = main_num[7];
                main_num[7] = main_num[6];
                main_num[6] = main_num[5];
                main_num[5] = main_num[4];
                main_num[4] = main_num[3];
                main_num[3] = main_num[2];
                main_num[2] = temp_char;

                for (int l = 0; l < 7; l++)
                {
                    temp_char   = main_num[9];
                    main_num[9] = main_num[8];
                    main_num[8] = main_num[7];
                    main_num[7] = main_num[6];
                    main_num[6] = main_num[5];
                    main_num[5] = main_num[4];
                    main_num[4] = main_num[3];
                    main_num[3] = temp_char;

                    for (int m = 0; m < 6; m++)
                    {
                        temp_char   = main_num[9];
                        main_num[9] = main_num[8];
                        main_num[8] = main_num[7];
                        main_num[7] = main_num[6];
                        main_num[6] = main_num[5];
                        main_num[5] = main_num[4];
                        main_num[4] = temp_char;

                        for (int n = 0; n < 5; n++)
                        {
                            temp_char   = main_num[9];
                            main_num[9] = main_num[8];
                            main_num[8] = main_num[7];
                            main_num[7] = main_num[6];
                            main_num[6] = main_num[5];
                            main_num[5] = temp_char;

                            for (int o = 0; o < 4; o++)
                            {
                                temp_char   = main_num[9];
                                main_num[9] = main_num[8];
                                main_num[8] = main_num[7];
                                main_num[7] = main_num[6];
                                main_num[6] = temp_char;

                                for (int p = 0; p < 3; p++)
                                {
                                    temp_char   = main_num[9];
                                    main_num[9] = main_num[8];
                                    main_num[8] = main_num[7];
                                    main_num[7] = temp_char;

                                    for (int q = 0; q < 2; q++)
                                    {
                                        temp_char   = main_num[9];
                                        main_num[9] = main_num[8];
                                        main_num[8] = temp_char;

                                        char d3[2] = { main_num[2] };
                                        char d4[2] = { main_num[3] };
                                        char d5[2] = { main_num[4] };

                                        if ((main_num[5] != '5') && (main_num[5] != '0'))
                                            continue;

                                        if ((atoi(d4) % 2) != 0)
                                            continue;

                                        if (((atoi(d3) + atoi(d4) + atoi(d5)) % 3) != 0)
                                            continue;

                                        char d567[4]  = { main_num[4], main_num[5], main_num[6] };
                                        if ((atoi(d567) % 7) != 0)
                                            continue;

                                        char d678[4]  = { main_num[5], main_num[6], main_num[7] };
                                        if ((atoi(d678) % 11) != 0)
                                            continue;

                                        char d789[4]  = { main_num[6], main_num[7], main_num[8] };
                                        if ((atoi(d789) % 13) != 0)
                                            continue;

                                        char d8910[4] = { main_num[7], main_num[8], main_num[9] };
                                        if ((atoi(d8910) % 17) != 0)
                                            continue;

                                        int duplicate_found = 0;
                                        for (int r = 0; r < count; r++)
                                        {
                                            if (pandigital_num_list[r] == atol(main_num))
                                            {
                                                duplicate_found = 1;
                                                break;
                                            }
                                        }

                                        if (!duplicate_found)
                                        {
                                            pandigital_num_list[count++] = atol(main_num);
                                            sum += atol(main_num);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    printf("%ld\n", sum);

    return 0;
}

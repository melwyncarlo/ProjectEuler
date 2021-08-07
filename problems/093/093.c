#include <stdio.h>

/* Copyright 2021 Melwyn Francis Carlo */

#define ERROR_NUM 0.0

float arithmetize(const float num1, const char op, const float num2)
{
    if (op == '+')
    {
        return num1 + num2;
    }
    else if (op == '-')
    {
        return num1 - num2;
    }
    else if (op == '*')
    {
        return num1 * num2;
    }
    else
    {
        if (num2 != 0)
            return num1 / num2;
        else
            return ERROR_NUM;
    }
}

int solve(const char arithmetic_expression[19])
{
    float result;

    float set_1_val = ERROR_NUM;
    float set_2_val = ERROR_NUM;
    float set_3_val = ERROR_NUM;

    if (arithmetic_expression[1] == '(')
        set_1_val = arithmetize( (float)(arithmetic_expression[2]  - '0'), 
                                 arithmetic_expression[3], 
                                 (float)(arithmetic_expression[6]  - '0'));
    if (arithmetic_expression[5] == '(')
        set_2_val = arithmetize( (float)(arithmetic_expression[6]  - '0'), 
                                 arithmetic_expression[9], 
                                 (float)(arithmetic_expression[12] - '0'));
    if (arithmetic_expression[11] == '(')
        set_3_val = arithmetize( (float)(arithmetic_expression[12] - '0'), 
                                 arithmetic_expression[15], 
                                 (float)(arithmetic_expression[16] - '0'));

    if (arithmetic_expression[0] == '(')
    {
        if (set_1_val == ERROR_NUM)
            result = arithmetize( (float)(arithmetic_expression[2]  - '0'), 
                                  arithmetic_expression[3], 
                                  set_2_val);
        else
            result = arithmetize( set_1_val, 
                                  arithmetic_expression[9], 
                                  (float)(arithmetic_expression[12] - '0'));

        result = arithmetize( result, 
                              arithmetic_expression[15], 
                              (float)(arithmetic_expression[16] - '0'));
    }
    else if (arithmetic_expression[4] == '(')
    {
        if (set_2_val == ERROR_NUM)
            result = arithmetize( (float)(arithmetic_expression[6]  - '0'), 
                                  arithmetic_expression[9], 
                                  set_3_val);
        else
            result = arithmetize( set_2_val, 
                                  arithmetic_expression[15], 
                                  (float)(arithmetic_expression[16] - '0'));

        result = arithmetize( (float)(arithmetic_expression[2] - '0'), 
                              arithmetic_expression[3], 
                              result);
    }
    else
    {
        result = arithmetize( set_1_val, arithmetic_expression[9], set_3_val);
    }

    if ((result < 0.0) || (result != (int)result))
        result = ERROR_NUM;

    return result;
}

int main()
{
    int  max_consecutive_count = 0;
    char max_consecutive_count_digits[5] = { 0 };

    const char op_combinations[64][3] = 
    {
        // All three same operators (none different).
            { '+', '+', '+' }, 
            { '-', '-', '-' }, 
            { '*', '*', '*' }, 
            { '/', '/', '/' }, 

        // Any three different operators (none same).

            // First of four, three operators combination.
                // First all three digits rotation.
                    { '+', '-', '*' }, 
                    { '+', '*', '-' }, 
                // Second all three digits rotation.
                    { '-', '*', '+' }, 
                    { '-', '+', '*' }, 
                // Third all three digits rotation.
                    { '*', '+', '-' }, 
                    { '*', '-', '+' }, 

            // Second of four, three operators combination.
                // First all three digits rotation.
                    { '+', '-', '/' },
                    { '+', '/', '-' }, 
                // Second all three digits rotation.
                    { '-', '/', '+' }, 
                    { '-', '+', '/' }, 
                // Third all three digits rotation.
                    { '/', '+', '-' }, 
                    { '/', '-', '+' }, 

            // Third of four, three operators combination.
                // First all three digits rotation.
                    { '+', '*', '/' }, 
                    { '+', '/', '*' }, 
                // Second all three digits rotation.
                    { '*', '/', '+' }, 
                    { '*', '+', '/' }, 
                // Third all three digits rotation.
                    { '/', '+', '*' }, 
                    { '/', '*', '+' }, 

            // Fourth of four, three operators combination.
                // First all three digits rotation.
                    { '-', '*', '/' }, 
                    { '-', '/', '*' }, 
                // Second all three digits rotation.
                    { '*', '/', '-' }, 
                    { '*', '-', '/' }, 
                // Third all three digits rotation.
                    { '/', '-', '*' }, 
                    { '/', '*', '-' }, 

        // Any two same operators (one different).

            // First of four operators, two same.
                // Second operator different.
                    { '+', '+', '-' }, 
                    { '+', '-', '+' }, 
                    { '-', '+', '+' }, 
                // Third operator different.
                    { '+', '+', '*' }, 
                    { '+', '*', '+' }, 
                    { '*', '+', '+' }, 
                // Fourth operator different.
                    { '+', '+', '/' }, 
                    { '+', '/', '+' }, 
                    { '/', '+', '+' }, 

            // Second of four operators, two same.
                // First operator different.
                    { '-', '-', '+' }, 
                    { '-', '+', '-' }, 
                    { '+', '-', '-' }, 
                // Third operator different.
                    { '-', '-', '*' }, 
                    { '-', '*', '-' }, 
                    { '*', '-', '-' }, 
                // Fourth operator different.
                    { '-', '-', '/' }, 
                    { '-', '/', '-' }, 
                    { '/', '-', '-' }, 

            // Third of four operators, two same.
                // First operator different.
                    { '*', '*', '+' }, 
                    { '*', '+', '*' }, 
                    { '+', '*', '*' }, 
                // Second operator different.
                    { '*', '*', '-' }, 
                    { '*', '-', '*' }, 
                    { '-', '*', '*' }, 
                // Fourth operator different.
                    { '*', '*', '/' }, 
                    { '*', '/', '*' }, 
                    { '/', '*', '*' }, 

            // Fourth of four operators, two same.
                // First operator different.
                    { '/', '/', '+' }, 
                    { '/', '+', '/' }, 
                    { '+', '/', '/' }, 
                // Second operator different.
                    { '/', '/', '-' }, 
                    { '/', '-', '/' }, 
                    { '-', '/', '/' }, 
                // Third operator different.
                    { '/', '/', '*' }, 
                    { '/', '*', '/' }, 
                    { '*', '/', '/' } 
    };

    for (int i = 1; i <= 6; i++)
    {
        for (int j = (i + 1); j <= 7; j++)
        {
            for (int k = (j + 1); k <= 8; k++)
            {
                for (int l = (k + 1); l <= 9; l++)
                {
                    int number_solutions_set[5000] = { 0 };

                    char a = i + '0';
                    char b = j + '0';
                    char c = k + '0';
                    char d = l + '0';

                    const char digit_combinations[24][4] = 
                    {
                        // First all four digits rotation.
                            // First last three digits rotation.
                                { a, b, c, d }, 
                                { a, b, d, c }, 
                            // Second last three digits rotation.
                                { a, c, d, b }, 
                                { a, c, b, d }, 
                            // Third last three digits rotation.
                                { a, d, b, c }, 
                                { a, d, c, b }, 

                        // Second all four digits rotation.
                            // First last three digits rotation.
                                { b, c, d, a }, 
                                { b, c, a, d }, 
                            // Second last three digits rotation.
                                { b, d, a, c }, 
                                { b, d, c, a }, 
                            // Third last three digits rotation.
                                { b, a, c, d }, 
                                { b, a, d, c }, 

                        // Third all four digits rotation.
                            // First last three digits rotation.
                                { c, d, a, b }, 
                                { c, d, b, a }, 
                            // Second last three digits rotation.
                                { c, a, b, d }, 
                                { c, a, d, b }, 
                            // Third last three digits rotation.
                                { c, b, d, a }, 
                                { c, b, a, d }, 

                        // Fourth all four digits rotation.
                            // First last three digits rotation.
                                { d, a, b, c }, 
                                { d, a, c, b }, 
                            // Second last three digits rotation.
                                { d, b, c, a }, 
                                { d, b, a, c }, 
                            // Third last three digits rotation.
                                { d, c, a, b }, 
                                { d, c, b, a } 
                    };

                    for (int m = 0; m < 24; m++)
                    {
                        for (int n = 0; n < 64; n++)
                        {
                            char arithmetic_expression[19] = 
                            {
                                ' ', ' ', digit_combinations[m][0], 
                                             op_combinations[n][0], 
                                ' ', ' ', digit_combinations[m][1], ' ', ' ', 
                                             op_combinations[n][1], 
                                ' ', ' ', digit_combinations[m][2], ' ', ' ', 
                                             op_combinations[n][2], 
                                          digit_combinations[m][3], ' ', ' ' 
                            };

                            /* No outer brackets, and set-1 and set-3 inner brackets. */
                                arithmetic_expression[1]  = '(';
                                arithmetic_expression[7]  = ')';
                                arithmetic_expression[11] = '(';
                                arithmetic_expression[17] = ')';
                                number_solutions_set[solve(arithmetic_expression)] = 1;

                            /* Left-most outer brackets, and set-1 inner brackets. */
                                arithmetic_expression[11] = ' ';
                                arithmetic_expression[17] = ' ';
                                arithmetic_expression[0]  = '(';
                                arithmetic_expression[14] = ')';
                                arithmetic_expression[1]  = '(';
                                arithmetic_expression[7]  = ')';
                                number_solutions_set[solve(arithmetic_expression)] = 1;

                            /* Left-most outer brackets, and set-2 inner brackets. */
                                arithmetic_expression[1]  = ' ';
                                arithmetic_expression[7]  = ' ';
                                arithmetic_expression[5]  = '(';
                                arithmetic_expression[13] = ')';
                                number_solutions_set[solve(arithmetic_expression)] = 1;

                            /* Right-most outer brackets, and set-2 inner brackets. */
                                arithmetic_expression[0]  = ' ';
                                arithmetic_expression[14] = ' ';
                                arithmetic_expression[4]  = '(';
                                arithmetic_expression[18] = ')';
                                number_solutions_set[solve(arithmetic_expression)] = 1;

                            /* Right-most outer brackets, and set-3 inner brackets. */
                                arithmetic_expression[5]  = ' ';
                                arithmetic_expression[13] = ' ';
                                arithmetic_expression[11] = '(';
                                arithmetic_expression[17] = ')';
                                number_solutions_set[solve(arithmetic_expression)] = 1;
                        }
                    }

                    int is_new_search     = 0;
                    int consecutive_count = 0;

                    for (int m = 1; m < 5000; m++)
                    {
                        if (number_solutions_set[m])
                        {
                            if (is_new_search)
                                is_new_search = 0;

                            consecutive_count++;
                        }
                        else
                        {
                            if (!is_new_search)
                            {
                                if (consecutive_count > max_consecutive_count)
                                {
                                    max_consecutive_count = consecutive_count;
                                    max_consecutive_count_digits[0] = a;
                                    max_consecutive_count_digits[1] = b;
                                    max_consecutive_count_digits[2] = c;
                                    max_consecutive_count_digits[3] = d;
                                }

                                consecutive_count = 0;
                                is_new_search = 1;
                            }
                        }
                    }
                }
            }
        }
    }

    printf("%s\n", max_consecutive_count_digits);

    return 0;
}

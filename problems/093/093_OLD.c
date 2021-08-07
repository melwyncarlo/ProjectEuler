#include <stdio.h>

/* Copyright 2021 Melwyn Francis Carlo */

#define ERROR_NUM 999

int arithmetize(int num1, char op, int num2)
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
         return ERROR_NUM
   }
}

int solve(char arithmetic_expression[19])
{
    /*
    char arithmetic_expression[19] = 
    {
        ' ', ' ', digit_combinations[j][0], 
                    op_combinations[k]][0], 
        ' ', ' ', digit_combinations[j][1], ' ', ' ', 
                    op_combinations[k]][1], 
        ' ', ' ', digit_combinations[j][2], ' ', ' ', 
                    op_combinations[k]][2], 
                  digit_combinations[j][3], ' ', ' ', 
    };
    */

    int result;

    int set_1_val = ERROR_NUM;
    int set_2_val = ERROR_NUM;
    int set_3_val = ERROR_NUM;

    if (arithmetic_expression[1] == '(')
        set_1_val = arithmetize( arithmetic_expression[2]  - '0', 
                                 arithmetic_expression[3], 
                                 arithmetic_expression[6]  - '0');
    else if (arithmetic_expression[5] == '(')
        set_2_val = arithmetize( arithmetic_expression[6]  - '0', 
                                 arithmetic_expression[9], 
                                 arithmetic_expression[12] - '0');
    else if (arithmetic_expression[11] == '(')
        set_3_val = arithmetize( arithmetic_expression[12] - '0', 
                                 arithmetic_expression[15], 
                                 arithmetic_expression[16] - '0');

    if (arithmetic_expression[0] == '(')
    {

    }
    else if (arithmetic_expression[5] == '(')
    {

    }
    else
    {
        if (set_1_val != ERROR_NUM)
        {
            if (arithmetic_expression[9] == '/')
            {
                result = arithmetize( set_1_val, '/', 
                                      arithmetic_expression[6]  - '0');
            }
            if (arithmetic_expression[15] == '/')
            {
                set_1_val = arithmetize( arithmetic_expression[2]  - '0', '/', 
                                         arithmetic_expression[6]  - '0');
            }
        }
    }

    return 0;
}

int main()
{
    /* Brackets can be 1 or 2. 
    1 bracket covering any 2 = 3 ways
    1 bracket covering any 3 = 2 ways
    for 2 brackets, appy the above functions again, but only for covering any 3.
    */

    const char str[13] = "Hello World ";

    const int num = 2021;

    /*
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
    }

    for (int i = 1; i <= 6; i++)
    {
        number_solutions_set[100] = { 0 };

        char a = i + '0';
        char b = (i + 1) + '0';
        char c = (i + 2) + '0';
        char d = (i + 3) + '0';

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
        }

        for (int j = 0; j < 24; j++)
        {
            for (int k = 0; k < 64; k++)
            {
                char arithmetic_expression[19] = 
                {
                    ' ', ' ', digit_combinations[j][0], 
                                op_combinations[k]][0], 
                    ' ', ' ', digit_combinations[j][1], ' ', ' ', 
                                op_combinations[k]][1], 
                    ' ', ' ', digit_combinations[j][2], ' ', ' ', 
                                op_combinations[k]][2], 
                              digit_combinations[j][3], ' ', ' ', 
                };

                arithmetic_expression[1]  = '(';
                arithmetic_expression[7]  = ')';
                int solution_1 = solve(arithmetic_expression);

                arithmetic_expression[0]  = '(';
                arithmetic_expression[14] = ')';
                int solution_2 = solve(arithmetic_expression);

                arithmetic_expression[0]  = ' ';
                arithmetic_expression[14] = ' ';
                arithmetic_expression[1]  = ' ';
                arithmetic_expression[7]  = ' ';
                arithmetic_expression[5]  = '(';
                arithmetic_expression[13] = ')';
                int solution_3 = solve(arithmetic_expression);

                arithmetic_expression[0]  = '(';
                arithmetic_expression[14] = ')';
                int solution_4 = solve(arithmetic_expression);

                arithmetic_expression[0]  = ' ';
                arithmetic_expression[14] = ' ';
                arithmetic_expression[4]  = '(';
                arithmetic_expression[18] = ')';
                int solution_5 = solve(arithmetic_expression);

                arithmetic_expression[4]  = ' ';
                arithmetic_expression[18] = ' ';
                arithmetic_expression[5]  = ' ';
                arithmetic_expression[13] = ' ';
                arithmetic_expression[11] = '(';
                arithmetic_expression[17] = ')';
                int solution_6 = solve(arithmetic_expression);

                arithmetic_expression[4]  = '(';
                arithmetic_expression[18] = ')';
                int solution_7 = solve(arithmetic_expression);

                arithmetic_expression[4]  = ' ';
                arithmetic_expression[18] = ' ';
                arithmetic_expression[11] = ' ';
                arithmetic_expression[17] = ' ';
                arithmetic_expression[0]  = '(';
                arithmetic_expression[8]  = ')';
                int solution_8 = solve(arithmetic_expression);

                arithmetic_expression[0]  = ' ';
                arithmetic_expression[8]  = ' ';
                arithmetic_expression[4]  = '(';
                arithmetic_expression[18] = ')';
                int solution_9 = solve(arithmetic_expression);
            }
        }
    }
    */

    printf("%s%d\n", str, num);

    return 0;
}

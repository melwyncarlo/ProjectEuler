#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Copyright 2021 Melwyn Francis Carlo */

int main()
{
    const int N = 46;
    const int MIN_N_REQUIRED = 10;
    const char common_english_words[46][10] = 
    {
        "this",  "that",  "with",  "and",   "but",   "for",  "from", "have", 
        "which", "would", "could", "their", "what",  "when", "than", "then", 
        "them",  "they",  "these", "those", "about", "make", "just", "know", 
        "your",  "good",  "some",  "other", "come",  "only", "also", "first", 
        "most",  "want",  "whom",  "the",   "or",    "so",   "one",  "two", 
        "now",   "its",   "back",  "after", "before","because" 
    };

    FILE *fp;
    char ch;
    char num[3] = { 0 };
    const char* FILE_NAME = "problems/059/p059_cipher.txt";

    int sum = 0;

    char encrypted_message[2000] = { 0 };
    char decrypted_message[2000] = { 0 };

    const int start_letter = 'a';
    const int end_letter   = 'z';

    int count     = 0;
    int num_index = 0;

    fp = fopen(FILE_NAME, "r");

    while ((ch = fgetc(fp)) != EOF)
    {
        if (ch == ',')
        {
            encrypted_message[count++] = atoi(num);
            num[1]    = 0;
            num_index = 0;
            continue;
        }

        num[num_index++] = ch;
    }

    fclose(fp);

    encrypted_message[count++] = atoi(num);

    int message_found = 0;

    for (int letter_1 = start_letter; letter_1 <= end_letter; letter_1++)
    {
        for (int letter_2 = start_letter; letter_2 <= end_letter; letter_2++)
        {
            for (int letter_3 = start_letter; letter_3 <= end_letter; letter_3++)
            {
                char passcode[4]       = { letter_1, letter_2, letter_3, 0 };

                int  passcode_i        = 0;
                int  correct_passcode  = 1;

                for (int i = 0; i < count; i++)
                {
                    decrypted_message[i] = encrypted_message[i] ^ passcode[passcode_i];
                    if (decrypted_message[i] < 32)
                    {
                        correct_passcode = 0;
                        break;
                    }
                    if (++passcode_i == 3)
                        passcode_i = 0;
                }

                if (correct_passcode)
                {
                    int number_of_words_found = 0;

                    for (int i = 0; i < N; i++)
                        if (strstr(decrypted_message, common_english_words[i]) != NULL)
                            number_of_words_found++;

                    if (number_of_words_found >= MIN_N_REQUIRED)
                    {
                        passcode_i = 0;

                        for (int j = 0; j < count; j++)
                        {
                            sum += decrypted_message[j];
                            if (++passcode_i == 3)
                                passcode_i = 0;
                        }
                        message_found = 1;
                        break;
                    }
                }

                if (message_found)
                    break;
            }

            if (message_found)
                break;
        }

        if (message_found)
            break;
    }

    printf("%d\n", sum);

    return 0;
}

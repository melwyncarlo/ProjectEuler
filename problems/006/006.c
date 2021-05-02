#include <stdio.h>

int main() {
    int n = 100;
    int sum = (n * (n + 1)) / 2;
    long int square_of_sum = sum * sum;
    long int sum_of_square = (n * (n + 1) * ((2 * n) + 1)) / 6;
    printf("\n%ld\n\n", square_of_sum - sum_of_square);
    return 0;
}

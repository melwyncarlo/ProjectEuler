#include <stdio.h>
#include <math.h>

long int binets_formula(int n_val) {
    return (1 / sqrt(5)) * (pow((1+sqrt(5)) / 2, n_val) 
    - pow((1-sqrt(5)) / 2, n_val));
}

int main() {
    int Fn_max = 4E+6;
    int n = ( log((Fn_max * sqrt(5)) + 0.5) / log((1 + sqrt(5)) / 2) );
    long int Fn_sum = binets_formula(n+2) - 1;
    long int Fn_sum_even = Fn_sum / 2;
    printf("\n%ld\n\n", Fn_sum_even);
    return 0;
}

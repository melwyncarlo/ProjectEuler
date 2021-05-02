PROGRAM F006

    IMPLICIT NONE

    INTEGER :: N, N_SUM, SQUARE_OF_SUM, SUM_OF_SQUARE

    N = 100
    N_SUM = (N * (N + 1)) / 2
    SQUARE_OF_SUM = N_SUM * N_SUM;
    SUM_OF_SQUARE = (N * (N + 1) * ((2 * N) + 1)) / 6;

    PRINT *, NEW_LINE('1'), NEW_LINE('1'),  &
             SQUARE_OF_SUM - SUM_OF_SQUARE, &
             NEW_LINE('1'), NEW_LINE('1')

END PROGRAM F006

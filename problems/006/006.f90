PROGRAM F006

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    INTEGER :: N, N_SUM, SQUARE_OF_SUM, SUM_OF_SQUARE

    N = 100
    N_SUM = (N * (N + 1)) / 2
    SQUARE_OF_SUM = N_SUM * N_SUM;
    SUM_OF_SQUARE = (N * (N + 1) * ((2 * N) + 1)) / 6;

    PRINT ('(I0)'), SQUARE_OF_SUM - SUM_OF_SQUARE

END PROGRAM F006

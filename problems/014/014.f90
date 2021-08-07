PROGRAM F014

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    INTEGER :: N_COUNT = 1E5

    INTEGER :: MAX_COUNT        = 0
    INTEGER :: MAX_COUNT_NUMBER = 0

    INTEGER :: I_COUNT

    INTEGER (KIND=8) :: N

    DO WHILE (N_COUNT < 1E6)

        I_COUNT = 0
        N = N_COUNT;

        DO WHILE (N /= 1)

            IF (MOD(N, INT(2, 8)) == 0) THEN
                N = N / 2;
            ELSE
                N = (3 * N) + 1;
            END IF

            I_COUNT = I_COUNT + 1

        END DO

        I_COUNT = I_COUNT + 1

        IF (I_COUNT > MAX_COUNT) THEN
            MAX_COUNT        = I_COUNT;
            MAX_COUNT_NUMBER = N_COUNT;
        END IF

        N_COUNT = N_COUNT + 1

    END DO

    PRINT ('(I0)'), MAX_COUNT_NUMBER

END PROGRAM F014

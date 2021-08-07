PROGRAM F021

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    INTEGER, PARAMETER        :: MAX_N = 10000 - 1

    INTEGER, DIMENSION(MAX_N) :: AMICABLE_NUMBERS = 0

    INTEGER :: PROPER_DIVISORS_SUM_1
    INTEGER :: PROPER_DIVISORS_SUM_2

    INTEGER :: I, J, N, J_MAX

    DO I = 2, MAX_N

        PROPER_DIVISORS_SUM_1 = 0
        PROPER_DIVISORS_SUM_2 = 0

        J_MAX = FLOOR(REAL(I) / 2.0)

        DO J = 1, J_MAX
            IF (MOD(I, J) == 0) PROPER_DIVISORS_SUM_1 =                        &
                                PROPER_DIVISORS_SUM_1 + J
        END DO

        J_MAX = FLOOR(REAL(PROPER_DIVISORS_SUM_1) / 2.0)

        DO J = 1, J_MAX
            IF (MOD(PROPER_DIVISORS_SUM_1, J) == 0) PROPER_DIVISORS_SUM_2 =    &
                                                    PROPER_DIVISORS_SUM_2 + J
        END DO

        IF (I == PROPER_DIVISORS_SUM_2 .AND. I /= PROPER_DIVISORS_SUM_1) THEN
            AMICABLE_NUMBERS(I) = 1
            AMICABLE_NUMBERS(PROPER_DIVISORS_SUM_1) = 1
        END IF

    END DO

    N = 0
    DO I = 1, MAX_N
        N = N + (I * AMICABLE_NUMBERS(I))
    END DO

    PRINT ('(I0)'), N

END PROGRAM F021

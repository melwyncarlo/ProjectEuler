PROGRAM F023

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    INTEGER, DIMENSION(10000) :: ABUNDANT_NUMBERS = 0

    INTEGER :: N         = 1
    INTEGER :: COUNT_VAL = 1

    INTEGER :: I, J, J_MAX, K, COUNT_BY_2, PROPER_DIVISORS_SUM

    LOGICAL :: ABUNDANT_SUM_FOUND

    DO I = 2, 28123

        PROPER_DIVISORS_SUM = 0

        J_MAX = FLOOR(REAL(I) / 2.0)

        DO J = 1, J_MAX
            IF (MOD(I, J) == 0) PROPER_DIVISORS_SUM = PROPER_DIVISORS_SUM + J;
        END DO

        IF (PROPER_DIVISORS_SUM > I) THEN
            ABUNDANT_NUMBERS(COUNT_VAL) = I
            COUNT_VAL = COUNT_VAL + 1
        END IF

        COUNT_BY_2 = FLOOR(REAL(COUNT_VAL) / 2.0)

        ABUNDANT_SUM_FOUND = .FALSE.

        DO J = 1, COUNT_BY_2

            K = J

            DO WHILE ((ABUNDANT_NUMBERS(J) + ABUNDANT_NUMBERS(K)) < I)
                K = K + 1
            END DO

            IF ((ABUNDANT_NUMBERS(J) + ABUNDANT_NUMBERS(K)) == I) THEN
                ABUNDANT_SUM_FOUND = .TRUE.
                EXIT
            END IF

        END DO

        IF (.NOT. ABUNDANT_SUM_FOUND) N = N + I

    END DO

    PRINT ('(I0)'), N

END PROGRAM F023

PROGRAM F012

    ! Copyright 2021 Melwyn Francis Carlo
    ! FILE REFERENCE: http://www.naturalnumbers.org/primes.html

    IMPLICIT NONE

    INTEGER :: PRIME_NUM
    CHARACTER (LEN=50), PARAMETER :: FILENAME = "problems/003/PrimeNumbers_Upto_1000000"

    INTEGER :: N          = 1 ! Just a dummy value.
    INTEGER :: COUNT_VAL  = 0
    INTEGER :: DIVISORS_N = 1

    INTEGER :: I, INDEX_VAL, N_MAX, N_SUM

    INTEGER, DIMENSION(2, 0:500) :: DIVISORS_ARR

    DO WHILE (DIVISORS_N <= 500)

        N     = 1001 + (1000 * COUNT_VAL)
        N_MAX = N + 999

        DO WHILE (N <= N_MAX)

            DIVISORS_ARR = 0
            N_SUM        = N * (N + 1) / 2

            DO WHILE (N_SUM /= 1)

                OPEN (2, FILE = FILENAME, STATUS = 'OLD')

                DO
                    READ(2, *, END=10) PRIME_NUM

                    IF (MOD(N_SUM, PRIME_NUM) == 0) THEN

                        INDEX_VAL = -1

                        DO I = 1, DIVISORS_ARR(1, 0)
                            IF (DIVISORS_ARR(2, I) == PRIME_NUM) THEN
                                INDEX_VAL = I
                                EXIT
                            END IF
                        END DO

                        IF (INDEX_VAL == -1) THEN
                            DIVISORS_ARR(1, 0) = DIVISORS_ARR(1, 0) + 1

                            DIVISORS_ARR(1, DIVISORS_ARR(1, 0))                &
                                = DIVISORS_ARR(1, DIVISORS_ARR(1, 0)) + 1

                            DIVISORS_ARR(2, DIVISORS_ARR(1, 0)) = PRIME_NUM
                        ELSE
                            DIVISORS_ARR(1, INDEX_VAL)                         &
                                = DIVISORS_ARR(1, INDEX_VAL) + 1
                        END IF

                        N_SUM = N_SUM / PRIME_NUM
                        EXIT

                    END IF

                END DO

                10 CLOSE(2)

            END DO

            DIVISORS_N = 1
            DO I = 1, DIVISORS_ARR(1, 0)
                DIVISORS_N = DIVISORS_N * (DIVISORS_ARR(1, I) + 1)
            END DO

            N = N + 1

            IF (DIVISORS_N > 500) EXIT

        END DO

        COUNT_VAL = COUNT_VAL + 1

    END DO

    N = N - 1

    PRINT ('(I0)'), N * (N + 1) / 2

END PROGRAM F012

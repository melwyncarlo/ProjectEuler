PROGRAM F050

    ! Copyright 2021 Melwyn Francis Carlo
    ! FILE REFERENCE: http://www.naturalnumbers.org/primes.html

    IMPLICIT NONE

    INTEGER :: PRIME_NUM
    CHARACTER (LEN=50), PARAMETER :: FILENAME = "problems/003/PrimeNumbers_Upto_1000000"

    INTEGER, DIMENSION(80000)     :: PRIMES_NUMS = 0;

    INTEGER :: N                = 1
    INTEGER :: COUNT_VAL        = 23
    INTEGER :: I_START          = 0
    INTEGER :: RESULTANT_PRIME  = 0

    LOGICAL :: PRIME_FOUND      = .FALSE.

    INTEGER :: I, I_BY_10, J, K, SUM_VAL

    OPEN (2, FILE = FILENAME, STATUS = 'OLD')

    DO
        READ(2, *, END=10) PRIME_NUM
        IF (PRIME_NUM > 1000000) EXIT
        IF (I_START == 0) THEN
            IF (PRIME_NUM > 100000) I_START = N - 1
        END IF
        PRIMES_NUMS(N) = PRIME_NUM
        N = N + 1
    END DO

    10 CLOSE(2)

    DO WHILE (COUNT_VAL < 1000)

        I = I_START
        PRIME_FOUND = .FALSE.

        DO WHILE (I < N)

            I_BY_10 = INT(I / 10)

            DO J = 1, I_BY_10

                SUM_VAL = 0

                DO K = J, (J + COUNT_VAL - 1)
                    SUM_VAL = SUM_VAL + PRIMES_NUMS(K)
                END DO

                IF (SUM_VAL > PRIMES_NUMS(I)) EXIT

                IF (SUM_VAL == PRIMES_NUMS(I)) THEN
                    RESULTANT_PRIME = PRIMES_NUMS(I)
                    PRIME_FOUND     = .TRUE.
                    COUNT_VAL       = COUNT_VAL + 1
                    EXIT
                END IF

            END DO

            IF (PRIME_FOUND) EXIT

            I = I + 1

        END DO

        COUNT_VAL = COUNT_VAL + 1

    END DO

    PRINT ('(I0)'), RESULTANT_PRIME

END PROGRAM F050

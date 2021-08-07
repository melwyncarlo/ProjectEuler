PROGRAM F047

    ! Copyright 2021 Melwyn Francis Carlo
    ! FILE REFERENCE: http://www.naturalnumbers.org/primes.html

    IMPLICIT NONE

    INTEGER, PARAMETER :: MAX_N = 5E5

    INTEGER :: PRIME_NUM
    CHARACTER (LEN=50), PARAMETER :: FILENAME = "problems/003/PrimeNumbers_Upto_1000000"

    INTEGER :: I          = 1
    INTEGER :: MAIN_COUNT = 0

    INTEGER, DIMENSION(INT(MAX_N/10)) :: PRIMES_LIST = 0

    INTEGER :: J, TEMP_I, I_BY_5, SUB_COUNT

    OPEN (2, FILE = FILENAME, STATUS = 'OLD')

    DO
        READ(2, *, END=10) PRIME_NUM
        IF (PRIME_NUM > MAX_N) EXIT
        PRIMES_LIST(I) = PRIME_NUM
        I = I + 1
    END DO

    10 CLOSE(2)

    DO I = 1000, MAX_N

        J         = 1
        TEMP_I    = I
        I_BY_5    = INT(I / 5)
        SUB_COUNT = 0

        DO WHILE (PRIMES_LIST(J) < I_BY_5)

            IF (MOD(TEMP_I, PRIMES_LIST(J)) /= 0) THEN
               J = J + 1
               CYCLE
            END IF

            DO WHILE (MOD(TEMP_I, PRIMES_LIST(J)) == 0)
                TEMP_I = TEMP_I / PRIMES_LIST(J)
            END DO

            SUB_COUNT = SUB_COUNT + 1

            IF (SUB_COUNT == 4) EXIT

            J = J + 1

        END DO

        IF (SUB_COUNT /= 4) THEN
            MAIN_COUNT = 0
            CYCLE
        END IF

        MAIN_COUNT = MAIN_COUNT + 1

        IF (MAIN_COUNT == 4) EXIT

    END DO

    PRINT ('(I0)'), I - 3

END PROGRAM F047

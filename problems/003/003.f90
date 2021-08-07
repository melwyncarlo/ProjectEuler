PROGRAM F003

    ! Copyright 2021 Melwyn Francis Carlo
    ! FILE REFERENCE: http://www.naturalnumbers.org/primes.html

    IMPLICIT NONE

    INTEGER :: PRIME_NUM
    REAL (KIND=8), PARAMETER :: N = 600851475143.D0
    REAL (KIND=8), PARAMETER :: PRIME_NUM_MAX = SQRT(N)
    REAL (KIND=8) :: PRIME_NUM_LARGEST
    CHARACTER (LEN=50), PARAMETER :: FILENAME = "problems/003/PrimeNumbers_Upto_1000000"

    OPEN (2, FILE = FILENAME, STATUS = 'OLD')

    PRIME_NUM_LARGEST = N
    DO
        READ(2, *, END=10) PRIME_NUM
        IF (PRIME_NUM <= PRIME_NUM_MAX) THEN
            IF (MOD(INT(N, 8), INT(PRIME_NUM, 8)) == 0) THEN
                PRIME_NUM_LARGEST = PRIME_NUM
            END IF
        ELSE
            EXIT
        END IF
    END DO

    10 CLOSE(2)

    PRINT ('(I0)'), INT(PRIME_NUM_LARGEST)

END PROGRAM F003

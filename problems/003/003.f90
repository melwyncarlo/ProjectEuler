PROGRAM F003

    ! FILE REFERENCE: http://www.naturalnumbers.org/primes.html

    IMPLICIT NONE

    INTEGER :: I, PRIME_NUM
    REAL (KIND=8), PARAMETER :: N = 600851475143.D0
    REAL (KIND=8), PARAMETER :: PRIME_NUM_MAX = SQRT(N)
    REAL (KIND=8) :: PRIME_NUM_LARGEST
    CHARACTER (LEN=30), PARAMETER :: FILENAME = "problems/003/PrimeNumbers_Upto_1000000"

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

    PRINT *, NEW_LINE('1'), NEW_LINE('1'),  &
             INT(PRIME_NUM_LARGEST),        &
             NEW_LINE('1'), NEW_LINE('1')

END PROGRAM F003

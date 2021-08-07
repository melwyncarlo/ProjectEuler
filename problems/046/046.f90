PROGRAM F046

    ! Copyright 2021 Melwyn Francis Carlo
    ! FILE REFERENCE: http://www.naturalnumbers.org/primes.html

    IMPLICIT NONE

    INTEGER, PARAMETER :: MAX_N = 1E5

    INTEGER :: PRIME_NUM
    CHARACTER (LEN=50), PARAMETER :: FILENAME = "problems/003/PrimeNumbers_Upto_1000000"

    INTEGER, DIMENSION(MAX_N)     :: PRIMES_LIST

    INTEGER :: SMALLEST_ODD_COMPOSITE_NUMBER = 0
    INTEGER :: I, J

    REAL    :: B

    LOGICAL :: PRIME_FOUND

    OPEN (2, FILE = FILENAME, STATUS = 'OLD')

    DO
        READ(2, *, END=10) PRIME_NUM
        IF (PRIME_NUM > MAX_N) EXIT
        PRIMES_LIST(PRIME_NUM) = 1
    END DO

    10 CLOSE(2)

    DO I = 35, MAX_N, 2

        IF (PRIMES_LIST(I) /= 0) CYCLE

        J = 2
        PRIME_FOUND = .FALSE.
        DO WHILE (J < I)

            IF (PRIMES_LIST(J) == 0) THEN
                J = J + 1
                CYCLE
            END IF

            B = SQRT(FLOAT(I - J) / 2.0)

            IF (B - REAL(INT(B)) <= 0) THEN
                PRIME_FOUND = .TRUE.
                EXIT
            END IF

            J = J + 1

        END DO

        IF (.NOT. PRIME_FOUND) THEN
            SMALLEST_ODD_COMPOSITE_NUMBER = I
            EXIT
        END IF

    END DO

    PRINT ('(I0)'), SMALLEST_ODD_COMPOSITE_NUMBER

END PROGRAM F046

PROGRAM F049

    ! Copyright 2021 Melwyn Francis Carlo
    ! FILE REFERENCE: http://www.naturalnumbers.org/primes.html

    IMPLICIT NONE

    INTEGER, PARAMETER :: N = 10

    INTEGER :: PRIME_NUM
    CHARACTER (LEN=50), PARAMETER :: FILENAME = "problems/003/PrimeNumbers_Upto_1000000"

    INTEGER, DIMENSION (1200, N)  :: PRIMES_NUMS = 0
    INTEGER, DIMENSION (1200)     :: PRIMES_DIGITS_OCCURRENCES = 0

    CHARACTER (LEN=N)                   :: PRIME_DIGITS  = ACHAR(0)
    CHARACTER (LEN=N), DIMENSION (1200) :: PRIMES_DIGITS = ACHAR(0)

    LOGICAL :: DUPLICATE_FOUND, SEQUENCE_FOUND

    INTEGER :: I, J, K, L, M, TEMP_VAL

    OPEN (2, FILE = FILENAME, STATUS = 'OLD')

    I = 1
    DO

        READ(2, *, END=10) PRIME_NUM

        IF (PRIME_NUM < 1000) CYCLE

        IF (PRIME_NUM > 9999) CYCLE

        PRIME_DIGITS = "0000000000"

        TEMP_VAL = INT(PRIME_NUM / 1000) + 1
        PRIME_DIGITS(TEMP_VAL:TEMP_VAL) = "1"
        TEMP_VAL = MOD(INT(PRIME_NUM / 100), 10) + 1
        PRIME_DIGITS(TEMP_VAL:TEMP_VAL) = "1"
        TEMP_VAL = MOD(INT(PRIME_NUM /  10), 10) + 1
        PRIME_DIGITS(TEMP_VAL:TEMP_VAL) = "1"
        TEMP_VAL = MOD(PRIME_NUM, 10) + 1
        PRIME_DIGITS(TEMP_VAL:TEMP_VAL) = "1"

        DUPLICATE_FOUND = .FALSE.
        DO J = 1, I

            IF (PRIMES_DIGITS(J) == PRIME_DIGITS) THEN

                IF (PRIMES_NUMS(J, N) == 0) THEN

                    DO K = 2, N
                        IF (PRIMES_NUMS(J, K) == 0) THEN
                            PRIMES_NUMS(J, K) = PRIME_NUM
                            EXIT
                        END IF
                    END DO

                    PRIMES_DIGITS_OCCURRENCES(J) = PRIMES_DIGITS_OCCURRENCES(J) + 1

                END IF

                DUPLICATE_FOUND = .TRUE.
                EXIT

            END IF

        END DO

        IF (.NOT. DUPLICATE_FOUND) THEN
            PRIMES_DIGITS_OCCURRENCES(I) = 0
            PRIMES_NUMS(I, 1) = PRIME_NUM
            PRIMES_DIGITS(I)  = PRIME_DIGITS
            I = I + 1
        END IF

    END DO

    10 CLOSE(2)

    J = 1
    K = 1
    L = 1
    M = 1
    SEQUENCE_FOUND = .FALSE.

    DO J = 1, I

        IF (PRIMES_DIGITS_OCCURRENCES(J) < 3) CYCLE

        DO K = 1, (N - 2)

            IF (PRIMES_NUMS(J, K) == 0) EXIT

            IF (PRIMES_NUMS(J, K) == 1487) CYCLE

            DO L = (K + 1), (N - 1)

                IF (PRIMES_NUMS(J, L) == 0) EXIT

                DO M = (L + 1), N
                    IF (PRIMES_NUMS(J, M) == 0) EXIT

                    IF ((PRIMES_NUMS(J, M) - PRIMES_NUMS(J, L))  &
                    ==  (PRIMES_NUMS(J, L) - PRIMES_NUMS(J, K))) THEN
                        SEQUENCE_FOUND = .TRUE.
                        EXIT
                    END IF
                END DO

                IF (SEQUENCE_FOUND) EXIT

            END DO

            IF (SEQUENCE_FOUND) EXIT

        END DO

        IF (SEQUENCE_FOUND) EXIT

    END DO

    PRINT ('(3I0)'), PRIMES_NUMS(J, K), PRIMES_NUMS(J, L), PRIMES_NUMS(J, M)

END PROGRAM F049

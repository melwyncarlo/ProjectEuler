PROGRAM F027

    ! Copyright 2021 Melwyn Francis Carlo
    ! FILE REFERENCE: http://www.naturalnumbers.org/primes.html

    IMPLICIT NONE

    INTEGER :: PRIME_NUM
    CHARACTER (LEN=50), PARAMETER :: FILENAME = "problems/003/PrimeNumbers_Upto_1000000"

    INTEGER, DIMENSION(1000) :: PRIMES_LIST

    INTEGER :: A       = -999
    INTEGER :: B_COUNT =    0

    INTEGER :: A_MAX   = 0
    INTEGER :: B_MAX   = 0
    INTEGER :: N_MAX   = 0

    INTEGER :: I = 1

    INTEGER :: B, N, J, MAX_PRIME

    OPEN (2, FILE = FILENAME, STATUS = 'OLD')

    DO WHILE (I /= 1000)
        READ(2, *, END=10) PRIME_NUM
        IF (PRIME_NUM < 1000) B_COUNT = B_COUNT + 1
        PRIMES_LIST(I) = PRIME_NUM
        I = I + 1
    END DO

    10 CLOSE(2)

    DO WHILE (A < 1000)

        B = 1
        DO WHILE (B < B_COUNT)

            N = 1
            J = 1
            MAX_PRIME = (N * N) + (A * N) + PRIMES_LIST(B)

            DO WHILE (J < 1000)

                IF (PRIMES_LIST(J) > MAX_PRIME) EXIT

                IF (MAX_PRIME == PRIMES_LIST(J)) THEN
                    N = N + 1
                    J = 1
                    MAX_PRIME = (N * N) + (A * N) + PRIMES_LIST(B)
                    CYCLE
                END IF

                J = J + 1

            END DO

            IF (N > N_MAX) THEN
                N_MAX = N
                A_MAX = A
                B_MAX = PRIMES_LIST(B)
            END IF

            B = B + 1

        END DO

        A = A + 1

    END DO

    PRINT ('(I0)'), A_MAX * B_MAX

END PROGRAM F027

PROGRAM F007

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    INTEGER, PARAMETER :: NTH = 10001, N = 1E+6
    INTEGER :: I, J, PRIMES_N
    LOGICAL, DIMENSION(N+1) :: INTEGERS_LIST

    ! USING THE ALGORITHM OF SIEVE OF EROSTHENES
    INTEGERS_LIST = .TRUE.
    I = 2
    DO WHILE ((I*I) <= N)
        IF (INTEGERS_LIST(I)) THEN
            J = I * I
            DO WHILE (J <= N)
                INTEGERS_LIST(J) = .FALSE.
                J = J + I
            END DO
        END IF
        I = I + 1
    END DO

    PRIMES_N = 0
    DO I = 2, N
        IF (INTEGERS_LIST(I)) THEN
            PRIMES_N = PRIMES_N + 1
            IF (PRIMES_N == NTH) THEN
                GOTO 10
            END IF
        END IF
    END DO

    10 CONTINUE

    PRINT ('(I0)'), I

END PROGRAM F007

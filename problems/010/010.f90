PROGRAM F010

    IMPLICIT NONE

    INTEGER, PARAMETER :: N = 2E+6
    INTEGER :: I, J
    INTEGER (KIND=8) :: PRIMES_SUM
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
    PRIMES_SUM = 0
    DO I = 2, N
        IF (INTEGERS_LIST(I)) THEN
            PRIMES_SUM = PRIMES_SUM + I
        END IF
    END DO

    10 PRINT *, NEW_LINE('1'), NEW_LINE('1'),   &
                PRIMES_SUM,                     &
                NEW_LINE('1'), NEW_LINE('1')

END PROGRAM F010

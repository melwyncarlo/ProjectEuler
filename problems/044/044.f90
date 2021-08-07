PROGRAM F044

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    INTEGER, PARAMETER :: MAX_N = 5E3

    INTEGER :: MIN_PD = 1E7

    INTEGER :: I, J, P1, P2, P1PP2, P1MP2

    REAL    :: SQRT_TERM

    DO I = 1, MAX_N

        P1 = FLOOR(0.5 * I * ((3 * I) - 1))

        DO J = (I + 1), MAX_N

            P2 = FLOOR(0.5 * J * ((3 * J) - 1))

            P1PP2 = P1 + P2

            SQRT_TERM = SQRT(1.0E0 + (24.0E0 * REAL(P1PP2)))

            IF (SQRT_TERM - INT(SQRT_TERM) > 0) CYCLE

            IF (MOD((INT(SQRT_TERM) + 1), 6) /= 0) CYCLE

            P1MP2 = P2 - P1

            SQRT_TERM = SQRT(1.0E0 + (24.0E0 * REAL(P1MP2)))

            IF (SQRT_TERM - INT(SQRT_TERM) > 0) CYCLE

            IF (MOD((INT(SQRT_TERM) + 1), 6) == 0) THEN
                IF (P1MP2 < MIN_PD) MIN_PD = P1MP2
            END IF

        END DO

    END DO

    PRINT ('(I0)'), MIN_PD

END PROGRAM F044

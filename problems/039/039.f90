PROGRAM F039

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    INTEGER :: P_MAX_SOLUTIONS = 0
    INTEGER :: N_MAX_SOLUTIONS = 0

    INTEGER :: B, N, P

    REAL    :: A, B2, P2

    DO P = 1000, 500, -1

        B = 1
        N = 0

        DO
            IF (B == INT(REAL(P) / 2.0)) EXIT

            P2 = REAL(P)
            B2 = REAL(B)

            A = ((P2 * P2) - (2.0 * P2 * B2)) / ((2.0 * P2) - (2.0 * B2))

            IF (A - REAL(FLOOR(A)) <= 0) N = N + 1

            B = B + 1

        END DO

        IF (N > N_MAX_SOLUTIONS) THEN
            N_MAX_SOLUTIONS = N
            P_MAX_SOLUTIONS = P
        END IF

    END DO

    PRINT ('(I0)'), P_MAX_SOLUTIONS

END PROGRAM F039

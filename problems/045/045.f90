PROGRAM F045

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    INTEGER (KIND=8), PARAMETER :: MAX_N     = 1E5

    REAL    (KIND=8), PARAMETER :: TOLERANCE = 1E-5

    REAL    (KIND=8)            :: SQRT_TERM,  TN

    INTEGER :: I

    DO I = 286, MAX_N

        TN = 0.5D0 * I * (I + 1.0D0)

        SQRT_TERM = DSQRT(1.D0 + (24.D0 * TN))

        IF ((SQRT_TERM - REAL(FLOOR(SQRT_TERM, 8), 8)) > TOLERANCE) CYCLE

        IF (MOD(FLOOR(SQRT_TERM, 8) + 1.0D0, 6.0D0) > TOLERANCE) CYCLE

        SQRT_TERM = DSQRT(1.D0 + (8.D0 * TN))

        IF ((SQRT_TERM - REAL(FLOOR(SQRT_TERM, 8), 8)) > TOLERANCE) CYCLE

        IF (MOD(FLOOR(SQRT_TERM, 8) + 1.0D0, 4.0D0) <= TOLERANCE) EXIT

    END DO

    PRINT ('(I0)'), FLOOR(TN, 8)

END PROGRAM F045
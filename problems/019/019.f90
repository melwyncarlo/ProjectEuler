PROGRAM F019

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    ! The first element is a dummy element.
    INTEGER, PARAMETER, DIMENSION(13) :: MONTH_CONSTANT = &
    (/ 0, 1, -1, 0, 0, 1, 1, 2, 3, 3, 4, 4, 5 /)

    INTEGER :: N = 0

    INTEGER :: DAY_VAL, I, J

    DO I = 1901, 2000

        DO J = 1, 12

            DAY_VAL =         (((I - 1) * 365) + FLOOR(REAL(I - 1) / 400.0)    &
                    + FLOOR(REAL(I - 1) / 4.0) - FLOOR(REAL(I - 1) / 100.0)    &
                    +          ((J - 1) *  30) + MONTH_CONSTANT(J) + 1)

            IF (MOD(I, 4) == 0 .AND. J > 2) DAY_VAL = DAY_VAL + 1

            DAY_VAL = MOD(DAY_VAL, 7)

            IF (DAY_VAL == 0) N = N + 1

        END DO

    END DO

    PRINT ('(I0)'), N

END PROGRAM F019

PROGRAM F002

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    INTEGER :: N
    REAL :: BINETS_FORMULA, FN_MAX, FN_SUM, FN_SUM_EVEN
    FN_MAX = 4E+6
    N = INT( LOG((FN_MAX * SQRT(5.0)) + 0.5) / LOG((1 + SQRT(5.0)) / 2) )
    FN_SUM = (BINETS_FORMULA(N + 2) - 1)
    FN_SUM_EVEN = FN_SUM / 2;

    PRINT *, NEW_LINE('1'), NEW_LINE('1'),  &
             INT(FN_SUM_EVEN),              &
             NEW_LINE('1'), NEW_LINE('1')

END PROGRAM F002


REAL FUNCTION BINETS_FORMULA (N_VAL)

    IMPLICIT NONE

    INTEGER, INTENT(IN) :: N_VAL

    BINETS_FORMULA = (1 / SQRT(5.D0)) * ( (((1 + SQRT(5.D0)) / 2) ** N_VAL) &
                   - (((1 - SQRT(5.D0)) / 2) ** N_VAL) )

END FUNCTION BINETS_FORMULA

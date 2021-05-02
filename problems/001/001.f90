PROGRAM F001

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    INTEGER, PARAMETER :: VAL_1A = FLOOR((1000.0 - 1.0) / 3.0);
    INTEGER, PARAMETER :: VAL_1B = 3 * ((VAL_1A * (VAL_1A + 1)) / 2);
    INTEGER, PARAMETER :: VAL_2A = FLOOR((1000.0 - 1.0) / 5.0);
    INTEGER, PARAMETER :: VAL_2B = 5 * ((VAL_2A * (VAL_2A + 1)) / 2);
    INTEGER, PARAMETER :: VAL_3A = FLOOR((1000.0 - 1.0) / 15.0);
    INTEGER, PARAMETER :: VAL_3B = 15 * ((VAL_3A * (VAL_3A + 1)) / 2);

    PRINT *, NEW_LINE('1'), NEW_LINE('1'),  &
             VAL_1B + VAL_2B - VAL_3B,      &
             NEW_LINE('1'), NEW_LINE('1')

END PROGRAM F001

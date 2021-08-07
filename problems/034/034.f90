PROGRAM F034

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    INTEGER, DIMENSION(10), PARAMETER :: FACTORIALS = &
    (/ 1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880 /)

    INTEGER :: SUM_VAL = 0

    INTEGER :: I, I_LEN, J, DIGITS_SUM

    CHARACTER (LEN=10) :: I_STR

    DO I = 100, 100000

        WRITE(I_STR, '(I10)') I
        I_STR = ADJUSTL(I_STR)

        I_LEN = LEN_TRIM(I_STR)

        DIGITS_SUM = 0

        DO J = 1, I_LEN
            DIGITS_SUM = DIGITS_SUM &
                       + FACTORIALS(IACHAR(I_STR(J:J))-IACHAR('0')+1)
        END DO

        IF (DIGITS_SUM == I) SUM_VAL = SUM_VAL + I

    END DO

    PRINT ('(I0)'), SUM_VAL

END PROGRAM F034

PROGRAM F030

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    CHARACTER (LEN=10) :: STR

    INTEGER :: SUM_VAL       = 0
    INTEGER :: SUM_OF_POWERS = 0

    INTEGER :: I, J, STR_LEN

    DO I = 2, 1000000

        WRITE(STR, '(I10)') I
        STR = ADJUSTL(STR)

        STR_LEN = LEN_TRIM(STR)

        SUM_OF_POWERS = 0

        DO J = 1, STR_LEN
            SUM_OF_POWERS = SUM_OF_POWERS                                      &
                          + ((IACHAR(STR(J:J))-IACHAR('0')) ** 5)
        END DO

        IF (SUM_OF_POWERS == I) SUM_VAL = SUM_VAL + I

    END DO

    PRINT ('(I0)'), SUM_VAL

END PROGRAM F030

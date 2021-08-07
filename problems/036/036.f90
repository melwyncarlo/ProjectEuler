PROGRAM F036

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    ! Initial values denoting the numbers 0, 1, 3, 5, 7, and 9.
    INTEGER :: SUM_VAL = 25

    CHARACTER (LEN=10) :: DECIMAL
    CHARACTER (LEN=30) :: BINARY

    LOGICAL :: IS_DECIMAL_PALINDROMIC, IS_BINARY_PALINDROMIC

    INTEGER :: I, J, DECIMAL_LEN, DECIMAL_LEN_BY_2,                            &
                      BINARY_LEN,  BINARY_LEN_BY_2,                            &
                        TEMP_LEN,  QUOTIENT

    DO I = 10, 1000000

        IF (MOD(I, 2) == 0) CYCLE

        DECIMAL     = ACHAR(0)
        WRITE (DECIMAL, '(I0)') I
        DECIMAL_LEN = LEN_TRIM(DECIMAL)

        IS_DECIMAL_PALINDROMIC = .TRUE.

        IF (DECIMAL_LEN /= 1) THEN

            DECIMAL_LEN_BY_2 = FLOOR(REAL(DECIMAL_LEN) / 2.0)
            DO J = 1, DECIMAL_LEN_BY_2
                TEMP_LEN = DECIMAL_LEN - J + 1
                IF (DECIMAL(J:J) /= DECIMAL(TEMP_LEN:TEMP_LEN)) THEN
                    IS_DECIMAL_PALINDROMIC = .FALSE.
                    EXIT
                END IF
            END DO

        END IF

        IF (.NOT. IS_DECIMAL_PALINDROMIC) CYCLE

        BINARY = ACHAR(0)

        J = 1
        QUOTIENT = I
        DO WHILE (QUOTIENT /= 0)
            WRITE (BINARY(J:J), '(I1)') MOD(QUOTIENT, 2)
            QUOTIENT = FLOOR(REAL(QUOTIENT) / 2.0)
            J = J + 1
        END DO

        IS_BINARY_PALINDROMIC = .TRUE.

        BINARY_LEN      = LEN_TRIM(BINARY)
        BINARY_LEN_BY_2 = FLOOR(REAL(BINARY_LEN) / 2.0)

        DO J = 1, BINARY_LEN_BY_2
            TEMP_LEN = BINARY_LEN - J + 1
            IF (BINARY(J:J) /= BINARY(TEMP_LEN:TEMP_LEN)) THEN
                IS_BINARY_PALINDROMIC = .FALSE.
                EXIT
            END IF
        END DO

        IF (.NOT. IS_BINARY_PALINDROMIC) CYCLE

        SUM_VAL = SUM_VAL + I

    END DO

    PRINT ('(I0)'), SUM_VAL

END PROGRAM F036

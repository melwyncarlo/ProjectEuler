PROGRAM F025

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    CHARACTER (LEN=1000), DIMENSION(3) :: FIBONACCI_VAL = REPEAT("0", 1000)

    CHARACTER (LEN=10) :: SUMMAND_1, SUMMAND_2
    CHARACTER (LEN=11) :: TEMP_STR

    INTEGER :: VAL_1_LENGTH = 3
    INTEGER :: VAL_2_LENGTH = 2

    INTEGER (KIND=8) :: SUMMATION, SUMMAND_1_NUM, SUMMAND_2_NUM

    INTEGER :: I, J, STR_LENGTH, VAL_0_LENGTH, TEMP_INDEX

    FIBONACCI_VAL(1)( 998:998 ) = '1'
    FIBONACCI_VAL(1)( 999:999 ) = '4'
    FIBONACCI_VAL(1)(1000:1000) = '4'
    FIBONACCI_VAL(2)( 999:999 ) = '8'
    FIBONACCI_VAL(2)(1000:1000) = '9'
    FIBONACCI_VAL(3)( 999:999 ) = '5'
    FIBONACCI_VAL(3)(1000:1000) = '5'

    I = 12

    DO WHILE (FIBONACCI_VAL(1)(1:1) == '0')

        FIBONACCI_VAL(3) = FIBONACCI_VAL(2)
        FIBONACCI_VAL(2) = FIBONACCI_VAL(1)

        STR_LENGTH = VAL_1_LENGTH
        IF (VAL_2_LENGTH > VAL_1_LENGTH) STR_LENGTH = VAL_2_LENGTH
        STR_LENGTH = ( INT((STR_LENGTH - 1) / 10) + 1 ) * 10

        VAL_0_LENGTH = 0

        DO J = 1, (STR_LENGTH - 9), 10

            SUMMAND_1 = FIBONACCI_VAL(2)(992-J:1001-J)
            SUMMAND_2 = FIBONACCI_VAL(3)(992-J:1001-J)

            READ (SUMMAND_1, '(I10)') SUMMAND_1_NUM
            READ (SUMMAND_2, '(I10)') SUMMAND_2_NUM

            SUMMATION = SUMMAND_1_NUM + SUMMAND_2_NUM

            IF (J /= 1) SUMMATION = SUMMATION                                  &
                                  + IACHAR(FIBONACCI_VAL(1)(1001-J:1001-J))    &
                                  - IACHAR('0')

            WRITE (TEMP_STR, '(I0.11)') SUMMATION

            TEMP_INDEX = 991 - J

            IF (TEMP_INDEX == 0) THEN
                TEMP_INDEX = 1
                FIBONACCI_VAL(1)(TEMP_INDEX:TEMP_INDEX+9 ) = TEMP_STR(2:)
            ELSE
                FIBONACCI_VAL(1)(TEMP_INDEX:TEMP_INDEX+10) = TEMP_STR(1:)
            END IF

            IF (J == (STR_LENGTH - 9))                                         &
                VAL_0_LENGTH = J + INT(LOG10(REAL(SUMMATION, 8)))

        END DO

        VAL_2_LENGTH = VAL_1_LENGTH
        VAL_1_LENGTH = VAL_0_LENGTH

        I = I + 1

    END DO

    PRINT ('(I0)'), I

END PROGRAM F025

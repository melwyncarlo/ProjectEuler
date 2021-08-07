PROGRAM F033

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    INTEGER, DIMENSION(4, 2) :: PRODUCTS_LIST

    CHARACTER (LEN=10) :: TEMP_STR

    REAL    :: VALUE_1, VALUE_2

    INTEGER :: COUNT_VAL = 1

    INTEGER :: I, J, TEMP_NUM_11, TEMP_NUM_12, TEMP_NUM_21,                    &
                     TEMP_NUM_22, TEMP_NUM_3,  TEMP_NUM_4

    LOGICAL :: REDUCED

    DO I = 10, 50

        DO J = 10, 99

            IF ((I >= J) .OR. (MOD(I, 10) == 0) .OR. (MOD(J, 10) == 0)) CYCLE

            WRITE(TEMP_STR, '(I10)') I
            TEMP_STR = ADJUSTL(TEMP_STR)

            TEMP_NUM_11 = IACHAR(TEMP_STR(1:1)) - IACHAR('0')
            TEMP_NUM_12 = IACHAR(TEMP_STR(2:2)) - IACHAR('0')

            WRITE(TEMP_STR, '(I10)') J
            TEMP_STR = ADJUSTL(TEMP_STR)

            TEMP_NUM_21 = IACHAR(TEMP_STR(1:1)) - IACHAR('0')
            TEMP_NUM_22 = IACHAR(TEMP_STR(2:2)) - IACHAR('0')

            TEMP_NUM_3 = 99999
            TEMP_NUM_4 = 99999

             IF  ((TEMP_NUM_11 == TEMP_NUM_21)                                 &
            .AND. (TEMP_NUM_12 /= TEMP_NUM_22)) THEN

                TEMP_NUM_3 = TEMP_NUM_12
                TEMP_NUM_4 = TEMP_NUM_22

            ELSE IF ((TEMP_NUM_11 == TEMP_NUM_22)                              &
            .AND.    (TEMP_NUM_12 /= TEMP_NUM_21)) THEN

                TEMP_NUM_3 = TEMP_NUM_12
                TEMP_NUM_4 = TEMP_NUM_21

            ELSE IF ((TEMP_NUM_12 == TEMP_NUM_21)                              &
            .AND.    (TEMP_NUM_11 /= TEMP_NUM_22)) THEN

                TEMP_NUM_3 = TEMP_NUM_11
                TEMP_NUM_4 = TEMP_NUM_22

            ELSE IF ((TEMP_NUM_12 == TEMP_NUM_22)                              &
            .AND.    (TEMP_NUM_11 /= TEMP_NUM_21)) THEN

                TEMP_NUM_3 = TEMP_NUM_11
                TEMP_NUM_4 = TEMP_NUM_21

            END IF

            IF (TEMP_NUM_3 /= 99999) THEN

                VALUE_1 = (FLOOR(REAL(I) * 1.0E5 / REAL(J))) / 1.0E5;
                VALUE_2 = (FLOOR(REAL(TEMP_NUM_3) * 1.0E5 /                    &
                           REAL(TEMP_NUM_4))) / 1.0E5;

                IF  ((VALUE_1 - VALUE_2) <  1.0E-5                             &
               .AND. (VALUE_1 - VALUE_2) > -1.0E-5) THEN

                    PRODUCTS_LIST(COUNT_VAL, 1) = I
                    PRODUCTS_LIST(COUNT_VAL, 2) = J
                    COUNT_VAL = COUNT_VAL + 1
                END IF

            END IF

        END DO

    END DO

    PRODUCTS_LIST(1, 1) = PRODUCTS_LIST(1, 1) * PRODUCTS_LIST(2, 1)            &
                        * PRODUCTS_LIST(3, 1) * PRODUCTS_LIST(4, 1)

    PRODUCTS_LIST(1, 2) = PRODUCTS_LIST(1, 2) * PRODUCTS_LIST(2, 2)            &
                        * PRODUCTS_LIST(3, 2) * PRODUCTS_LIST(4, 2)

    DO WHILE ((PRODUCTS_LIST(1, 1) /= 1) .AND. (PRODUCTS_LIST(1, 2) /= 1))

        I = 2
        REDUCED = .FALSE.

        DO WHILE (.NOT. REDUCED)

            IF ((MOD(PRODUCTS_LIST(1, 1), I) == 0)                             &
          .AND. (MOD(PRODUCTS_LIST(1, 2), I) == 0)) THEN

                PRODUCTS_LIST(1, 1) = PRODUCTS_LIST(1, 1) / I
                PRODUCTS_LIST(1, 2) = PRODUCTS_LIST(1, 2) / I
                REDUCED = .TRUE.

            ELSE
                I = I + 1
            END IF

        END DO

    END DO

    PRINT ('(I0)'), PRODUCTS_LIST(1, 2)

END PROGRAM F033

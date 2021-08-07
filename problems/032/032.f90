PROGRAM F032

    ! CopyrIght 2021 MeLwyn FrancIs CarLo

    IMPLICIT NONE

    CHARACTER (LEN=10) :: TEMP_STR_1, TEMP_STR_2
    CHARACTER (LEN=20) :: TEMP_STR_3

    LOGICAL :: DUPLICATE_FOUND

    INTEGER, DIMENSION(1000) :: PRODUCTS_LIST = 0

    INTEGER :: SUM_VAL   = 0
    INTEGER :: COUNT_VAL = 1

    INTEGER :: I, J, K, L, PRODUCT_VAL, PRODUCT_LENGTH, TOTAL_LENGTH

    DO I = 1, 9999

        WRITE(TEMP_STR_1, '(I0)') I

        IF (INDEX(TEMP_STR_1, '0') /= 0) CYCLE

        DUPLICATE_FOUND = .FALSE.

        DO J = 1, LEN_TRIM(TEMP_STR_1)

            DO K = 1, LEN_TRIM(TEMP_STR_1)

                IF (J == K) CYCLE

                IF (TEMP_STR_1(J:J) == TEMP_STR_1(K:K)) THEN
                    DUPLICATE_FOUND = .TRUE.
                    EXIT
                END IF

            END DO

            IF (DUPLICATE_FOUND) EXIT

        END DO

        IF (DUPLICATE_FOUND) CYCLE

        DO J = 1, 9999

            WRITE(TEMP_STR_2, '(I0)') J

            IF (INDEX(TEMP_STR_2, '0') /= 0) CYCLE

            DUPLICATE_FOUND = .FALSE.

            DO K = 1, LEN_TRIM(TEMP_STR_2)

                DO L = 1, LEN_TRIM(TEMP_STR_2)

                    IF (K == L) CYCLE

                    IF (TEMP_STR_2(K:K) == TEMP_STR_2(L:L)) THEN
                        DUPLICATE_FOUND = .TRUE.
                        EXIT
                    END IF

                END DO

                IF (DUPLICATE_FOUND) EXIT

            END DO

            IF (DUPLICATE_FOUND) CYCLE

            DUPLICATE_FOUND = .FALSE.

            DO K = 1, LEN_TRIM(TEMP_STR_2)

                IF (INDEX(TEMP_STR_1, TEMP_STR_2(K:K)) /= 0) THEN
                    DUPLICATE_FOUND = .TRUE.
                    EXIT
                END IF

            END DO

            IF (DUPLICATE_FOUND) CYCLE

            PRODUCT_VAL = I * J
            PRODUCT_LENGTH = INT(LOG10(FLOAT(PRODUCT_VAL))) + 1

            WRITE(TEMP_STR_3, '(I0)') PRODUCT_VAL

            IF (INDEX(TEMP_STR_3, '0') /= 0) CYCLE

            TOTAL_LENGTH = PRODUCT_LENGTH                                      &
                         + LEN_TRIM(TEMP_STR_1)                                &
                         + LEN_TRIM(TEMP_STR_2)

            IF (TOTAL_LENGTH > 9) EXIT

            IF (TOTAL_LENGTH /= 9) CYCLE

            DUPLICATE_FOUND = .FALSE.

            DO K = 1, LEN_TRIM(TEMP_STR_3)

                DO L = 1, LEN_TRIM(TEMP_STR_3)

                    IF (K == L) CYCLE

                    IF (TEMP_STR_3(K:K) == TEMP_STR_3(L:L)) THEN
                        DUPLICATE_FOUND = .TRUE.
                        EXIT
                    END IF

                END DO

                IF (DUPLICATE_FOUND) EXIT

            END DO

            IF (DUPLICATE_FOUND) CYCLE

            DUPLICATE_FOUND = .FALSE.

            DO K = 1, PRODUCT_LENGTH

                IF (INDEX(TEMP_STR_1, TEMP_STR_3(K:K)) /= 0                    &
               .OR. INDEX(TEMP_STR_2, TEMP_STR_3(K:K)) /= 0) THEN

                    DUPLICATE_FOUND = .TRUE.
                    EXIT

                END IF

            END DO

            IF (DUPLICATE_FOUND) CYCLE

            PRODUCTS_LIST(COUNT_VAL) = PRODUCT_VAL

            COUNT_VAL = COUNT_VAL + 1

        END DO

    END DO

    DO I = 1, COUNT_VAL
        DO J = 1, COUNT_VAL
            IF (I == J) CYCLE
            IF (PRODUCTS_LIST(I) == PRODUCTS_LIST(J)) PRODUCTS_LIST(J) = 0
        END DO
    END DO

    DO I = 1, COUNT_VAL
        SUM_VAL = SUM_VAL + PRODUCTS_LIST(I)
    END DO

    PRINT ('(I0)'), SUM_VAL

END PROGRAM F032

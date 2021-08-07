PROGRAM F003

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    INTEGER, PARAMETER :: MAX_N   = 1000

    CHARACTER (LEN=10) :: SUM_VAL = "0000000001"

    CHARACTER (LEN=20) :: TEMP_STR
    CHARACTER (LEN=10) :: PRODUCT_VAL

    CHARACTER (LEN=10), DIMENSION(10) :: SUB_PRODUCT_SUM

    INTEGER :: I, J, K, L, CARRY_VAL, TEMP_VAL, SUB_PRODUCT, SUB_PRODUCT_LEN

    DO I = 2, MAX_N

        IF (MOD(I, 10) == 0) CYCLE

        PRODUCT_VAL = "0000000001"

        DO J = 1, I

            SUB_PRODUCT_SUM = "0000000000"

            DO K = 10, 1, -1
                SUB_PRODUCT     = (IACHAR(PRODUCT_VAL(K:K)) - IACHAR('0')) * I
                TEMP_STR        = ACHAR(0)
                WRITE(TEMP_STR, "(I0.10)") SUB_PRODUCT
                SUB_PRODUCT_LEN = LEN_TRIM(ADJUSTL(TEMP_STR))
                SUB_PRODUCT_SUM(K)(1:K) = TEMP_STR((SUB_PRODUCT_LEN-K+1):SUB_PRODUCT_LEN)
            END DO

            CARRY_VAL = 0

            DO L = 10, 1, -1

                TEMP_VAL  = IACHAR(SUB_PRODUCT_SUM(1)(L:L))                    &
                          + IACHAR(SUB_PRODUCT_SUM(2)(L:L))                    &
                          + IACHAR(SUB_PRODUCT_SUM(3)(L:L))                    &
                          + IACHAR(SUB_PRODUCT_SUM(4)(L:L))                    &
                          + IACHAR(SUB_PRODUCT_SUM(5)(L:L))                    &
                          + IACHAR(SUB_PRODUCT_SUM(6)(L:L))                    &
                          + IACHAR(SUB_PRODUCT_SUM(7)(L:L))                    &
                          + IACHAR(SUB_PRODUCT_SUM(8)(L:L))                    &
                          + IACHAR(SUB_PRODUCT_SUM(9)(L:L))                    &
                          + IACHAR(SUB_PRODUCT_SUM(10)(L:L))                   &
                          - (IACHAR('0') * 10)                                 &
                          + CARRY_VAL

                CARRY_VAL = INT(TEMP_VAL / 10)

                PRODUCT_VAL(L:L) = ACHAR(IACHAR('0') + MOD(TEMP_VAL, 10))

            END DO

        END DO

        CARRY_VAL = 0

        DO J = 10, 1, -1
            TEMP_VAL     = IACHAR(SUM_VAL(J:J)) + IACHAR(PRODUCT_VAL(J:J))     &
                         - IACHAR('0') - IACHAR('0')                           &
                         + CARRY_VAL
            CARRY_VAL    = INT(TEMP_VAL / 10)
            SUM_VAL(J:J) = ACHAR(IACHAR('0') + MOD(TEMP_VAL, 10))
        END DO

    END DO

    PRINT ('(A)'), SUM_VAL

END PROGRAM F003

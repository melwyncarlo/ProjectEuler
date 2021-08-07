PROGRAM F016

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    CHARACTER, DIMENSION(500) :: N_STR

    INTEGER :: SUM_OF_DIGITS = 0

    CHARACTER (LEN=4) :: TEMP_PRODUCT

    CHARACTER, DIMENSION(500,500) :: PRODUCTS_ARRAY

    INTEGER :: STR_LENGTH = 4

    INTEGER :: I, J, K, K1, K2, K3, TEMP_SUM

    N_STR(1) = '1'
    N_STR(2) = '0'
    N_STR(3) = '2'
    N_STR(4) = '4'

    DO I = 2, 100

        DO J = STR_LENGTH, 1, -1

            WRITE(TEMP_PRODUCT, '(I0.4)') 1024 * (IACHAR(N_STR(J)) - IACHAR('0'))

            DO K1 = 1, J
                PRODUCTS_ARRAY(J, K1) = '0'
            END DO

            DO K2 = (J + 1), (J + 4)
                PRODUCTS_ARRAY(J, K2) = TEMP_PRODUCT(K2-J:K2-J)
            END DO

            DO K3 = (J + 5), (STR_LENGTH + 4)
                PRODUCTS_ARRAY(J, K3) = '0'
            END DO

        END DO

        N_STR = '0'

        DO K = (STR_LENGTH + 4), 2, -1

            TEMP_SUM = 0
            DO J = 1, STR_LENGTH
                TEMP_SUM = TEMP_SUM + IACHAR(PRODUCTS_ARRAY(J, K)) - IACHAR('0')
            END DO
            TEMP_SUM = TEMP_SUM + IACHAR(N_STR(K)) - IACHAR('0')

            N_STR(K)   = ACHAR(MOD(TEMP_SUM, 10) + IACHAR('0'))
            N_STR(K-1) = ACHAR(FLOOR(REAL(TEMP_SUM) / 10.0) + IACHAR('0'))

        END DO

        STR_LENGTH = STR_LENGTH + 4

    END DO

    DO I = 1, STR_LENGTH
        SUM_OF_DIGITS = SUM_OF_DIGITS + IACHAR(N_STR(I)) - IACHAR('0')
    END DO

    PRINT ('(I0)'), SUM_OF_DIGITS

END PROGRAM F016

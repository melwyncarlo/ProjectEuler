PROGRAM F029

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    CHARACTER (LEN=200) :: N_STR, N_STR_COPY
    CHARACTER (LEN=201) :: LINE
    CHARACTER (LEN=3)   :: TEMP_PRODUCT

    CHARACTER (LEN=50), PARAMETER :: FILENAME = "problems/029/temp.dat"

    CHARACTER, DIMENSION(201,201) :: PRODUCTS_ARRAY

    INTEGER :: SUM_VAL = 0

    INTEGER :: I, J, K1, K2, K3, M, N, TEMP_SUM, STR_LENGTH

    OPEN (2, FILE = FILENAME, STATUS = 'REPLACE', ACTION='READWRITE')

    DO I = 2, 100

        WRITE(N_STR, '(I0.2)') I

        STR_LENGTH = 2

        PRODUCTS_ARRAY = ACHAR(0)

        DO J = 2, 100

            DO M = STR_LENGTH, 1, -1

                WRITE(TEMP_PRODUCT, '(I0.3)') I * (IACHAR(N_STR(M:M)) - IACHAR('0'))

                DO K1 = 1, M
                    PRODUCTS_ARRAY(M, K1) = '0'
                END DO

                DO K2 = (M + 1), (M + 3)
                    PRODUCTS_ARRAY(M, K2) = TEMP_PRODUCT(K2-M:K2-M)
                END DO

                DO K3 = (M + 4), (STR_LENGTH + 3)
                    PRODUCTS_ARRAY(M, K3) = '0'
                END DO

            END DO

            N_STR = REPEAT("0", 200)

            DO M = (STR_LENGTH + 3), 2, -1

                TEMP_SUM = 0
                DO N = 1, STR_LENGTH
                    TEMP_SUM = TEMP_SUM + IACHAR(PRODUCTS_ARRAY(N, M)) - IACHAR('0')
                END DO

                TEMP_SUM = TEMP_SUM + IACHAR(N_STR(M-1:M-1)) - IACHAR('0')
                N_STR(M-1:M-1) = ACHAR(MOD(TEMP_SUM, 10) + IACHAR('0'))
                IF ((M - 2) > 0)                                               &
                N_STR(M-2:M-2) = ACHAR(FLOOR(REAL(TEMP_SUM) / 10.0) + IACHAR('0'))

            END DO
!IF (I == 99 .AND. J == 100) PRINT *, N_STR, NEW_LINE('1')
            STR_LENGTH = STR_LENGTH + 2

            N_STR_COPY = REPEAT("0", 200)

            N_STR_COPY(201-STR_LENGTH:) = N_STR(1:STR_LENGTH)

            REWIND 2
            DO
                READ(2, '(A)', END=10) LINE
                IF (LINE == N_STR_COPY) GOTO 20
            END DO

            10 CONTINUE

            BACKSPACE 2
            WRITE(2, '(A)') N_STR_COPY

            20 CONTINUE

        END DO

    END DO

    REWIND 2
    DO
        READ(2, '(A)', END=30) LINE
        SUM_VAL = SUM_VAL + 1
    END DO

    30 CLOSE(2, STATUS='DELETE')

    PRINT ('(I0)'), SUM_VAL

END PROGRAM F029

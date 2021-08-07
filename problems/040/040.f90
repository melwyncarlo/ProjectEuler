PROGRAM F040

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    INTEGER, PARAMETER :: MAX_E = 7; ! 1E+x

    INTEGER, DIMENSION(MAX_E), PARAMETER :: N = &
    (/ 1, 10, 100, 1000, 10000, 100000, 1000000 /)

    CHARACTER (LEN=10) :: NUM_STR

    INTEGER, DIMENSION(MAX_E) :: INDICES

    INTEGER :: PRODUCT_VAL = 1

    INTEGER :: I, J, NUM, INDEX_VAL

    INDICES(1) = 1

    DO I = 2, MAX_E
        INDICES(I) = INDICES(I-1) + (9 * (I - 1) * INT(10 ** (I - 2)))
    END DO

    DO I = 1, MAX_E

        J = 1
        DO WHILE (J <= MAX_E)
            IF (N(I) < INDICES(J)) EXIT
            J = J + 1
        END DO
        J = J - 2

        NUM = INT(10 ** J) + INT((N(I) - INDICES(J+1)) / (J + 1))

        WRITE(NUM_STR, '(I10)') NUM
        NUM_STR = ADJUSTL(NUM_STR)

        INDEX_VAL = MOD(N(I) - INDICES(J+1), J + 1) + 1

        PRODUCT_VAL = PRODUCT_VAL &
                    * (IACHAR(NUM_STR(INDEX_VAL:INDEX_VAL)) - IACHAR('0'));

    END DO

    PRINT ('(I0)'), PRODUCT_VAL

END PROGRAM F040

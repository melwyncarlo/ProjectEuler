PROGRAM F024

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    INTEGER, PARAMETER :: N_MAX = 10
    INTEGER, PARAMETER :: I     = 1000000

    CHARACTER (LEN=1), DIMENSION(N_MAX) :: NUMBERS = &
    (/ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" /)

    INTEGER                    :: N               = N_MAX
    INTEGER (KIND=8)           :: N_PRODUCT       = N_MAX
    INTEGER (KIND=8)           :: MAX_PERMUTATION = 1

    CHARACTER (LEN=N_MAX)      :: DIGITS_VAL

    INTEGER :: J, INDEX_VAL

    DO J = 2, N_MAX
        MAX_PERMUTATION = MAX_PERMUTATION * J
    END DO

    INDEX_VAL = FLOOR(REAL((I - 1) * N_PRODUCT) / REAL(MAX_PERMUTATION)) + 1

    DIGITS_VAL(1:1) = NUMBERS(INDEX_VAL)

    DO J = 2, N_MAX

        N = N - 1
        N_PRODUCT = N_PRODUCT * N

        IF (INDEX_VAL < (N_MAX - 1)) NUMBERS(INDEX_VAL:N_MAX) = EOSHIFT(       &
                                     NUMBERS(INDEX_VAL:N_MAX), 1, "0")

        INDEX_VAL = MOD(FLOOR(REAL((I - 1) * N_PRODUCT)                        &
                  / REAL(MAX_PERMUTATION)), N) + 1

        DIGITS_VAL(J:J) = NUMBERS(INDEX_VAL)

    END DO

    PRINT ('(A)'), DIGITS_VAL

END PROGRAM F024

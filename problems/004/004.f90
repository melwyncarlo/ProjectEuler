PROGRAM F004

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    INTEGER :: I, J, N
    LOGICAL :: IS_PALINDROME

    DO I = 999, 900, -1
        DO J = 999, 900, -1
            N = I * J
            IF (IS_PALINDROME(N)) THEN
                GOTO 10
            END IF
        END DO
    END DO

    10 PRINT *, NEW_LINE('1'), NEW_LINE('1'),   &
                N,                              &
                NEW_LINE('1'), NEW_LINE('1')

END PROGRAM F004


LOGICAL FUNCTION IS_PALINDROME (N_VAL)

    IMPLICIT NONE

    INTEGER, INTENT(IN) :: N_VAL
    INTEGER :: I, N_LEN, N_LEN_BY_2
    CHARACTER (LEN=10)  :: N_STR
    CHARACTER (LEN=5)   :: N_STR_SPLIT_1, N_STR_SPLIT_2

    WRITE (N_STR, '(I0)') N_VAL
    N_LEN_BY_2 = INT(CEILING(LEN_TRIM(N_STR) / 2.0))
    N_STR_SPLIT_1 = N_STR(1:3)
    N_STR_SPLIT_2 = N_STR(N_LEN_BY_2+1:)
    FORALL (I=1:N_LEN_BY_2) N_STR_SPLIT_2(I:I) &
         = N_STR_SPLIT_2(N_LEN_BY_2-I+1:N_LEN_BY_2-I+1)
    IF (N_STR_SPLIT_1 == N_STR_SPLIT_2) THEN
        IS_PALINDROME = .TRUE.
    ELSE
        IS_PALINDROME = .FALSE.
    END IF

END FUNCTION IS_PALINDROME



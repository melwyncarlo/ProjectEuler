PROGRAM F052

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    INTEGER, PARAMETER :: NX    = 6
    INTEGER, PARAMETER :: N_MAX = 10

    CHARACTER (LEN=N_MAX), DIMENSION(NX) :: NUM_NX_STR
    CHARACTER (LEN=N_MAX)                :: DIGITS_SET_1, DIGITS_SET_2

    LOGICAL   :: SAME_DIGITS;

    INTEGER   :: N      = 6;
    INTEGER   :: NUM_1X = 125875;

    INTEGER   :: K, L, NUM_NX, NUM_MAX, TEMP_INDEX

    DO WHILE (N /= N_MAX)

        NUM_MAX = FLOOR(5.0 * (10.0 ** (N - 1)) / 3.0);

        DO WHILE (NUM_1X <= NUM_MAX)

            NUM_NX     = 0
            NUM_NX_STR = ACHAR(0)

            DIGITS_SET_1 = REPEAT("0", N_MAX)

            DO K = 1, NX

                NUM_NX = NUM_NX + NUM_1X
                WRITE(NUM_NX_STR(K)(1:N), '(I0)') NUM_NX

                DIGITS_SET_2 = REPEAT("0", N_MAX)

                DO L = 1, NX
                    TEMP_INDEX = IACHAR(NUM_NX_STR(K)(L:L)) - IACHAR('0') + 1
                    DIGITS_SET_2(TEMP_INDEX:TEMP_INDEX) = "1"
                END DO

                IF (K == 1) THEN
                    DIGITS_SET_1 = DIGITS_SET_2
                    CYCLE
                END IF

                SAME_DIGITS = .TRUE.

                IF (DIGITS_SET_1 /= DIGITS_SET_2) THEN
                    SAME_DIGITS = .FALSE.
                    EXIT
                END IF

            END DO

            IF (SAME_DIGITS) EXIT

            NUM_1X = NUM_1X + 1

        END DO

        IF (SAME_DIGITS) EXIT

        N = N + 1

    END DO

    PRINT ('(I0)'), NUM_1X

END PROGRAM F052

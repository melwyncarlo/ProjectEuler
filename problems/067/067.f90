PROGRAM F067

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    INTEGER, DIMENSION(100, 100)  :: TRIANGLE

    CHARACTER (LEN=50), PARAMETER :: FILENAME = "problems/067/p067_triangle.txt"
    CHARACTER (LEN=300)           :: TRIANGLE_NUM_ROW
    CHARACTER (LEN=2)             :: TRIANGLE_NUM

    INTEGER :: I = 1

    INTEGER :: J, DIGITS_I, DIGITS_N

    OPEN (2, FILE = FILENAME, STATUS = 'OLD')

    DO

        READ(2, '(A)', END=10) TRIANGLE_NUM_ROW

        J        = 1;
        DIGITS_N = 1;

        DO DIGITS_I = 1, LEN_TRIM(TRIANGLE_NUM_ROW) + 1

            IF (DIGITS_N <= 2) THEN
                TRIANGLE_NUM(DIGITS_N:DIGITS_N) = TRIANGLE_NUM_ROW(DIGITS_I:DIGITS_I);
                DIGITS_N = DIGITS_N + 1
            ELSE
                READ(TRIANGLE_NUM, *) TRIANGLE(I, J)
                DIGITS_N = 1
                J = J + 1
            END IF

        END DO

        IF (J <= 100) THEN
            DO WHILE (J /= 100)
                TRIANGLE(I, J) = 0
                J = J + 1
            END DO
        END IF

        I = I + 1

    END DO

    10 CLOSE(2)

    DO I = 99, 1, -1

        DO J = 1, I

            IF (TRIANGLE(I+1, J) >= TRIANGLE(I+1, J+1)) THEN
                TRIANGLE(I, J) = TRIANGLE(I, J) + TRIANGLE(I+1, J)
            ELSE
                TRIANGLE(I, J) = TRIANGLE(I, J) + TRIANGLE(I+1, J+1)
            END IF

        END DO

    END DO

    PRINT ('(I0)'), TRIANGLE(1, 1)

END PROGRAM F067

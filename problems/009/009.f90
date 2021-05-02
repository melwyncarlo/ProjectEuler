PROGRAM F009

    IMPLICIT NONE

    INTEGER :: A, C, PRODUCT_VAL
    REAL (KIND=8) :: B

    A = 1
    DO
        B = (5E+5 - (1E+3 * A)) / (1E+3 - A)
        IF ( ((B - INT(B)) == 0) .AND. (B > A) ) THEN
            C = 1000 - A - B
            IF (B < C) THEN
                PRODUCT_VAL = A * B * C
                EXIT
            END IF
        END IF
        A = A + 1
        IF (A == 1000) THEN
            A = A + 1
        END IF
    END DO

    PRINT *, NEW_LINE('1'), NEW_LINE('1'),  &
             PRODUCT_VAL,                   &
             NEW_LINE('1'), NEW_LINE('1')

END PROGRAM F009

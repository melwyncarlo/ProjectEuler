PROGRAM F009

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    INTEGER :: A, PRODUCT_VAL
    REAL (KIND=8) :: B, C

    A = 1
    DO
        B = (5E+5 - (1E+3 * A)) / (1E+3 - A)
        IF ( ((B - INT(B)) <= 0) .AND. (B > A) ) THEN
            C = 1000.0 - REAL(A, 8) - B
            IF (B < C) THEN
                PRODUCT_VAL = INT(REAL(A, 8) * B * C)
                EXIT
            END IF
        END IF
        A = A + 1
        IF (A == 1000) THEN
            A = A + 1
        END IF
    END DO

    PRINT ('(I0)'), PRODUCT_VAL

END PROGRAM F009

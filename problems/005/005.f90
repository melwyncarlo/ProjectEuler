PROGRAM F005

    IMPLICIT NONE

    INTEGER :: I, N

    I = 1
    DO
        N = 20 * I
        ! BASED ON THE RULES OF DIVISIBILITY, NOT ALL NUMBERS FROM 1 TO 20 
        ! HAVE TO BE TESTED AGAINST.
        IF  ( (MOD(N, 19) == 0) .AND. (MOD(N, 17) == 0)   & 
        .AND. (MOD(N, 16) == 0) .AND. (MOD(N, 13) == 0)   &
        .AND. (MOD(N, 11) == 0) .AND. (MOD(N, 9)  == 0)   &
        .AND. (MOD(N, 8)  == 0) .AND. (MOD(N, 7)  == 0) ) THEN
            EXIT
        END IF
        I = I + 1;
    END DO

    PRINT *, NEW_LINE('1'), NEW_LINE('1'),   &
             N,                              &
             NEW_LINE('1'), NEW_LINE('1')

END PROGRAM F005

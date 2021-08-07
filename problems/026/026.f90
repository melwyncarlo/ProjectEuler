PROGRAM F026

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    CHARACTER (LEN=2000) :: BASE_NUMBER
    CHARACTER (LEN=8)    :: BASE_SUB_NUMBER

    CHARACTER (LEN=:), ALLOCATABLE :: TEMP_SUB_STR_001, TEMP_SUB_STR_002
    CHARACTER (LEN=:), ALLOCATABLE :: TEMP_SUB_STR_01,  TEMP_SUB_STR_02

    INTEGER :: I_MAX = 0
    INTEGER :: N     = 80

    INTEGER :: I, J, CARRY_VAL, FIND_LENGTH, QUOTIENT

    TEMP_SUB_STR_01  = ""
    TEMP_SUB_STR_02  = ""
    TEMP_SUB_STR_001 = ""
    TEMP_SUB_STR_002 = ""

    DO I = 11, 999

        IF (MOD(I, 2) == 0) CYCLE
        IF (MOD(I, 5) == 0) CYCLE
        IF (MOD(I, 7) == 0) CYCLE

        BASE_NUMBER = REPEAT("0", 2000);
        BASE_NUMBER(1:1) = '1';

        CARRY_VAL = 0
        DO J = 1, 2000, 5

            BASE_SUB_NUMBER = ACHAR(0)
            WRITE (BASE_SUB_NUMBER, '(I0.3)') CARRY_VAL
            BASE_SUB_NUMBER(4:8) = BASE_NUMBER(J:J+4)
            READ (BASE_SUB_NUMBER, *) QUOTIENT
            CARRY_VAL = MOD(QUOTIENT, I)
            QUOTIENT  = FLOOR (FLOAT(QUOTIENT) / FLOAT(I))

            WRITE (BASE_SUB_NUMBER, '(I0.5)') QUOTIENT
            BASE_NUMBER(J:J+4) = BASE_SUB_NUMBER(1:5)

        END DO

        J = 1
        DO WHILE (BASE_NUMBER(J:J) == '0')
            J = J + 1
        END DO

        FIND_LENGTH = N;

        DO WHILE (J <= (2001 - FIND_LENGTH))

            DEALLOCATE(TEMP_SUB_STR_001)
            ALLOCATE(CHARACTER (LEN=FIND_LENGTH) :: TEMP_SUB_STR_001)
            TEMP_SUB_STR_001 = BASE_NUMBER(J:J+FIND_LENGTH-1)

            DEALLOCATE(TEMP_SUB_STR_002)
            ALLOCATE(CHARACTER (LEN=(2001-FIND_LENGTH-J)) :: TEMP_SUB_STR_002)
            TEMP_SUB_STR_002 = BASE_NUMBER(J+FIND_LENGTH:2000)

            IF (INDEX(TEMP_SUB_STR_002, TEMP_SUB_STR_001) /= 0) THEN

                DEALLOCATE(TEMP_SUB_STR_01)
                ALLOCATE(CHARACTER (LEN=10) :: TEMP_SUB_STR_01)
                TEMP_SUB_STR_01 = TEMP_SUB_STR_001(1:10)

                DEALLOCATE(TEMP_SUB_STR_02)
                ALLOCATE(CHARACTER (LEN=(FIND_LENGTH-10)) :: TEMP_SUB_STR_02)
                TEMP_SUB_STR_02 = TEMP_SUB_STR_001(11:FIND_LENGTH)

                IF (INDEX(TEMP_SUB_STR_02, TEMP_SUB_STR_01) == 0) THEN

                    N = FIND_LENGTH
                    FIND_LENGTH = FIND_LENGTH + 1

                    IF (TEMP_SUB_STR_002(INDEX(TEMP_SUB_STR_002, TEMP_SUB_STR_001):) == TEMP_SUB_STR_002) THEN
                        I_MAX = I
                        EXIT
                    ELSE
                        CYCLE
                    END IF

                END IF

            END IF

            J = J + 1

        END DO

    END DO

    PRINT ('(I0)'), I_MAX

END PROGRAM F026

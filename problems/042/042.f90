PROGRAM F042

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    CHARACTER (LEN=50), PARAMETER :: FILENAME = "problems/042/p042_words.txt"
    CHARACTER (LEN=1) :: CH

    INTEGER :: COUNT_VAL =  0
    INTEGER :: INDEX_VAL = -1
    INTEGER :: WORD_VAL  =  0

    LOGICAL :: IS_INCREMENTED = .FALSE.

    REAL    :: SQRT_TERM, N_TERM

    OPEN (2, FILE = FILENAME, STATUS = 'OLD')

    READ(2, '(A1)', ADVANCE='NO', END=10) CH

    DO
        READ(2, '(A1)', ADVANCE='NO', END=10) CH

        IF ((CH >= 'A' .AND. CH <= 'Z') .OR. (CH >= 'a' .AND. CH <= 'z')) THEN

            WORD_VAL       = WORD_VAL  + IACHAR(CH) - 64
            INDEX_VAL      = INDEX_VAL + 1
            IS_INCREMENTED = .FALSE.

        ELSE

            IF (.NOT. IS_INCREMENTED) THEN

                INDEX_VAL = 0
                IS_INCREMENTED = .TRUE.

                SQRT_TERM = SQRT(1.0E0 + (8.0E0 * WORD_VAL))
                WORD_VAL = 0

                IF ((SQRT_TERM - INT(SQRT_TERM)) > 0.0) CYCLE

                N_TERM = (SQRT_TERM - 1.0) / 2.0

                IF ((N_TERM - INT(N_TERM)) > 0.0) CYCLE

                COUNT_VAL = COUNT_VAL + 1

            END IF

        END IF

    END DO

    10 CLOSE(2)

    PRINT ('(I0)'), COUNT_VAL

END PROGRAM F042

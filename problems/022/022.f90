PROGRAM F022

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    CHARACTER           :: CH
    CHARACTER (LEN=50)  :: NAME_VAL = ACHAR(0)
    CHARACTER (LEN=50), DIMENSION(5500) :: NAMES_LIST = ACHAR(0)
    CHARACTER (LEN=50), PARAMETER :: FILENAME = "problems/022/p022_names.txt"

    LOGICAL   :: IS_INCREMENTED = .FALSE.

    INTEGER   :: FILE_POS       = 2
    INTEGER   :: COUNT_VAL      = 1
    INTEGER   :: INDEX_VAL      = 1

    INTEGER   :: I, J, N, ALPHA_VAL

    OPEN (2, FILE = FILENAME, STATUS = 'OLD', ACCESS='DIRECT', RECL=1, FORM='UNFORMATTED')

    DO
        READ (2, REC=FILE_POS, ERR=10) CH
        FILE_POS = FILE_POS + 1

        IF ((CH >= 'A' .AND. CH <= 'Z') .OR. (CH >= 'a' .AND. CH <= 'z')) THEN
            IS_INCREMENTED = .FALSE.
            NAME_VAL(INDEX_VAL:INDEX_VAL) = CH
            INDEX_VAL = INDEX_VAL + 1
        ELSE
            IF (.NOT. IS_INCREMENTED) THEN
                INDEX_VAL = 1
                IS_INCREMENTED = .TRUE.

                NAMES_LIST(COUNT_VAL) = NAME_VAL

                COUNT_VAL = COUNT_VAL + 1
                NAME_VAL  = ACHAR(0)
            END IF
        END IF
    END DO

    10 CLOSE(2)

    COUNT_VAL = COUNT_VAL - 1

    DO I = 1, (COUNT_VAL - 1)
        DO J = (I + 1), COUNT_VAL
            IF (NAMES_LIST(I) > NAMES_LIST(J)) THEN
                NAME_VAL      = ACHAR(0)
                NAME_VAL      = NAMES_LIST(I)
                NAMES_LIST(I) = NAMES_LIST(J)
                NAMES_LIST(J) = NAME_VAL
            END IF
        END DO
    END DO

    N = 0

    DO I = 1, COUNT_VAL
        ALPHA_VAL = 0

        DO J = 1, LEN_TRIM(NAMES_LIST(I))
            ALPHA_VAL = ALPHA_VAL + IACHAR(NAMES_LIST(I)(J:J)) - 64
        END DO

        N = N + (I * ALPHA_VAL);
    END DO

    PRINT ('(I0)'), N

END PROGRAM F022

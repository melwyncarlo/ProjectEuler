PROGRAM F043

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    CHARACTER (LEN=10) :: MAIN_NUM_STR = "0123456789"
    CHARACTER (LEN=1)  :: TEMP_CHAR

    INTEGER (KIND=8), DIMENSION(100) :: PANDIGITAL_NUM_LIST = 0;
    INTEGER (KIND=8)   :: SUM_VAL = 0
    INTEGER (KIND=8)   :: MAIN_NUM

    INTEGER :: COUNT_VAL = 1
    INTEGER :: I, J, K, L, M, N, O, P, Q, R, TEMP_VAL

    LOGICAL :: DUPLICATE_FOUND

    DO I = 1, 10

        TEMP_CHAR           = MAIN_NUM_STR(10:10)
        MAIN_NUM_STR(10:10) = MAIN_NUM_STR(9:9)
        MAIN_NUM_STR(9:9)   = MAIN_NUM_STR(8:8)
        MAIN_NUM_STR(8:8)   = MAIN_NUM_STR(7:7)
        MAIN_NUM_STR(7:7)   = MAIN_NUM_STR(6:6)
        MAIN_NUM_STR(6:6)   = MAIN_NUM_STR(5:5)
        MAIN_NUM_STR(5:5)   = MAIN_NUM_STR(4:4)
        MAIN_NUM_STR(4:4)   = MAIN_NUM_STR(3:3)
        MAIN_NUM_STR(3:3)   = MAIN_NUM_STR(2:2)
        MAIN_NUM_STR(2:2)   = MAIN_NUM_STR(1:1)
        MAIN_NUM_STR(1:1)   = TEMP_CHAR

        DO J = 1, 9

            TEMP_CHAR           = MAIN_NUM_STR(10:10)
            MAIN_NUM_STR(10:10) = MAIN_NUM_STR(9:9)
            MAIN_NUM_STR(9:9)   = MAIN_NUM_STR(8:8)
            MAIN_NUM_STR(8:8)   = MAIN_NUM_STR(7:7)
            MAIN_NUM_STR(7:7)   = MAIN_NUM_STR(6:6)
            MAIN_NUM_STR(6:6)   = MAIN_NUM_STR(5:5)
            MAIN_NUM_STR(5:5)   = MAIN_NUM_STR(4:4)
            MAIN_NUM_STR(4:4)   = MAIN_NUM_STR(3:3)
            MAIN_NUM_STR(3:3)   = MAIN_NUM_STR(2:2)
            MAIN_NUM_STR(2:2)   = TEMP_CHAR

            DO K = 1, 8

                TEMP_CHAR           = MAIN_NUM_STR(10:10)
                MAIN_NUM_STR(10:10) = MAIN_NUM_STR(9:9)
                MAIN_NUM_STR(9:9)   = MAIN_NUM_STR(8:8)
                MAIN_NUM_STR(8:8)   = MAIN_NUM_STR(7:7)
                MAIN_NUM_STR(7:7)   = MAIN_NUM_STR(6:6)
                MAIN_NUM_STR(6:6)   = MAIN_NUM_STR(5:5)
                MAIN_NUM_STR(5:5)   = MAIN_NUM_STR(4:4)
                MAIN_NUM_STR(4:4)   = MAIN_NUM_STR(3:3)
                MAIN_NUM_STR(3:3)   = TEMP_CHAR

                DO L = 1, 7

                    TEMP_CHAR           = MAIN_NUM_STR(10:10)
                    MAIN_NUM_STR(10:10) = MAIN_NUM_STR(9:9)
                    MAIN_NUM_STR(9:9)   = MAIN_NUM_STR(8:8)
                    MAIN_NUM_STR(8:8)   = MAIN_NUM_STR(7:7)
                    MAIN_NUM_STR(7:7)   = MAIN_NUM_STR(6:6)
                    MAIN_NUM_STR(6:6)   = MAIN_NUM_STR(5:5)
                    MAIN_NUM_STR(5:5)   = MAIN_NUM_STR(4:4)
                    MAIN_NUM_STR(4:4)   = TEMP_CHAR

                    DO M = 1, 6

                        TEMP_CHAR           = MAIN_NUM_STR(10:10)
                        MAIN_NUM_STR(10:10) = MAIN_NUM_STR(9:9)
                        MAIN_NUM_STR(9:9)   = MAIN_NUM_STR(8:8)
                        MAIN_NUM_STR(8:8)   = MAIN_NUM_STR(7:7)
                        MAIN_NUM_STR(7:7)   = MAIN_NUM_STR(6:6)
                        MAIN_NUM_STR(6:6)   = MAIN_NUM_STR(5:5)
                        MAIN_NUM_STR(5:5)   = TEMP_CHAR

                        DO N = 1, 5

                            TEMP_CHAR           = MAIN_NUM_STR(10:10)
                            MAIN_NUM_STR(10:10) = MAIN_NUM_STR(9:9)
                            MAIN_NUM_STR(9:9)   = MAIN_NUM_STR(8:8)
                            MAIN_NUM_STR(8:8)   = MAIN_NUM_STR(7:7)
                            MAIN_NUM_STR(7:7)   = MAIN_NUM_STR(6:6)
                            MAIN_NUM_STR(6:6)   = TEMP_CHAR

                            DO O = 1, 4

                                TEMP_CHAR           = MAIN_NUM_STR(10:10)
                                MAIN_NUM_STR(10:10) = MAIN_NUM_STR(9:9)
                                MAIN_NUM_STR(9:9)   = MAIN_NUM_STR(8:8)
                                MAIN_NUM_STR(8:8)   = MAIN_NUM_STR(7:7)
                                MAIN_NUM_STR(7:7)   = TEMP_CHAR

                                DO P = 1, 3

                                    TEMP_CHAR           = MAIN_NUM_STR(10:10)
                                    MAIN_NUM_STR(10:10) = MAIN_NUM_STR(9:9)
                                    MAIN_NUM_STR(9:9)   = MAIN_NUM_STR(8:8)
                                    MAIN_NUM_STR(8:8)   = TEMP_CHAR

                                    DO Q = 1, 2

                                        TEMP_CHAR           = MAIN_NUM_STR(10:10)
                                        MAIN_NUM_STR(10:10) = MAIN_NUM_STR(9:9)
                                        MAIN_NUM_STR(9:9)   = TEMP_CHAR

                                        IF ((MAIN_NUM_STR(6:6) /= '5')         &
                                      .AND. (MAIN_NUM_STR(6:6) /= '0')) CYCLE

                                        IF (MOD(IACHAR(MAIN_NUM_STR(4:4))      &
                                        -       IACHAR('0'), 2) /= 0) CYCLE

                                        IF (MOD(IACHAR(MAIN_NUM_STR(3:3))      &
                                        +       IACHAR(MAIN_NUM_STR(4:4))      &
                                        +       IACHAR(MAIN_NUM_STR(5:5))      &
                                        -      (IACHAR('0') * 3), 3) /= 0) CYCLE

                                        READ (MAIN_NUM_STR(5:7), *) TEMP_VAL
                                        IF (MOD(TEMP_VAL, 7) /= 0) CYCLE

                                        READ (MAIN_NUM_STR(6:8), *) TEMP_VAL
                                        IF (MOD(TEMP_VAL, 11) /= 0) CYCLE

                                        READ (MAIN_NUM_STR(7:9), *) TEMP_VAL
                                        IF (MOD(TEMP_VAL, 13) /= 0) CYCLE

                                        READ (MAIN_NUM_STR(8:10), *) TEMP_VAL
                                        IF (MOD(TEMP_VAL, 17) /= 0) CYCLE

                                        READ (MAIN_NUM_STR, *) MAIN_NUM

                                        DUPLICATE_FOUND = .FALSE.

                                        DO R = 1, COUNT_VAL
                                            IF (PANDIGITAL_NUM_LIST(R)         &
                                            ==  MAIN_NUM) THEN

                                                DUPLICATE_FOUND = .TRUE.
                                                EXIT

                                            END IF
                                        END DO

                                        IF (.NOT. DUPLICATE_FOUND) THEN

                                            PANDIGITAL_NUM_LIST(COUNT_VAL)     &
                                            = MAIN_NUM

                                            SUM_VAL   = SUM_VAL   + MAIN_NUM
                                            COUNT_VAL = COUNT_VAL + 1

                                        END IF

                                    END DO
                                END DO
                            END DO
                        END DO
                    END DO
                END DO
            END DO
        END DO
    END DO

    PRINT ('(I0)'), SUM_VAL

END PROGRAM F043

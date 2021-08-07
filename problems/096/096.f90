PROGRAM F096

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    INTEGER, DIMENSION(50, 9, 9) :: SUDOKU

    INTEGER :: SUM_VAL   = 0
    INTEGER :: INDEX_VAL = 0
    INTEGER :: SUB_INDEX = 1

    INTEGER :: I, I2, J, J2, K, L, PUZZLE

    LOGICAL :: DUPLICATE_FOUND

    LOGICAL, DIMENSION(9, 9, 9)   :: DIGIT
    LOGICAL, DIMENSION(9, 9)      :: IS_FIXED_CELL

    CHARACTER (LEN=30), PARAMETER :: FILENAME = "problems/096/p096_sudoku.txt"
    CHARACTER (LEN=30)            :: NUM_STR

    OPEN (2, FILE = FILENAME, STATUS = 'OLD')

    DO
        READ(2, *, END=10) NUM_STR

        IF (NUM_STR(1:1) < '0' .OR. NUM_STR(1:1) > '9') THEN
            SUB_INDEX = 1
            INDEX_VAL = INDEX_VAL + 1
            CYCLE

        END IF

        DO I = 1, 9
            SUDOKU(INDEX_VAL, SUB_INDEX, I) = IACHAR(NUM_STR(I:I)) - IACHAR('0')
        END DO
        SUB_INDEX = SUB_INDEX + 1
    END DO

    10 CLOSE(2)

    DO PUZZLE = 1, 50

        IS_FIXED_CELL = .FALSE.

        DO I = 1, 9
            DO J = 1, 9
                IF (SUDOKU(PUZZLE, I, J) /= 0) IS_FIXED_CELL(I, J) = .TRUE.
            END DO
        END DO

        DIGIT = .FALSE.

        I = 1
        DO WHILE (I <= 9)
            J = 1
            DO WHILE (J <= 9)

                IF (IS_FIXED_CELL(I, J)) THEN
                    J = J + 1
                    CYCLE
                END IF

                I2 = (INT((I - 1) / 3) * 3) + 1
                J2 = (INT((J - 1) / 3) * 3) + 1

                DUPLICATE_FOUND = .TRUE.

                IF (.NOT. DIGIT(I, J, 1)  .OR. .NOT. DIGIT(I, J, 2)            &
               .OR. .NOT. DIGIT(I, J, 3)  .OR. .NOT. DIGIT(I, J, 4)            &
               .OR. .NOT. DIGIT(I, J, 5)  .OR. .NOT. DIGIT(I, J, 6)            &
               .OR. .NOT. DIGIT(I, J, 7)  .OR. .NOT. DIGIT(I, J, 8)            &
               .OR. .NOT. DIGIT(I, J, 9)) THEN

                    DO K = 1, 9

                        IF (DIGIT(I, J, K)) CYCLE

                        DUPLICATE_FOUND = .FALSE.

                        DO L = 1, 9
                            IF (L /= I) THEN
                                IF (SUDOKU(PUZZLE, L, J) == K) THEN
                                    DUPLICATE_FOUND = .TRUE.
                                    EXIT
                                END IF
                            END IF
                            IF (L /= J) THEN
                                IF (SUDOKU(PUZZLE, I, L) == K) THEN
                                    DUPLICATE_FOUND = .TRUE.
                                    EXIT
                                END IF
                            END IF
                        END DO

                        IF (.NOT. DUPLICATE_FOUND) THEN
                            IF ((SUDOKU(PUZZLE, I2,     J2)     == K)          &
                           .OR. (SUDOKU(PUZZLE, I2,     J2 + 1) == K)          &
                           .OR. (SUDOKU(PUZZLE, I2,     J2 + 2) == K)          &
                           .OR. (SUDOKU(PUZZLE, I2 + 1, J2)     == K)          &
                           .OR. (SUDOKU(PUZZLE, I2 + 1, J2 + 1) == K)          &
                           .OR. (SUDOKU(PUZZLE, I2 + 1, J2 + 2) == K)          &
                           .OR. (SUDOKU(PUZZLE, I2 + 2, J2)     == K)          &
                           .OR. (SUDOKU(PUZZLE, I2 + 2, J2 + 1) == K)          &
                           .OR. (SUDOKU(PUZZLE, I2 + 2, J2 + 2) == K)) THEN

                                DUPLICATE_FOUND = .TRUE.

                            END IF
                        END IF

                        IF (.NOT. DUPLICATE_FOUND) THEN
                            DIGIT(I, J, K)  = .TRUE.
                            SUDOKU(PUZZLE, I, J) = K
                            EXIT
                        END IF

                    END DO

                END IF

                IF (DUPLICATE_FOUND) THEN

                    DIGIT(I, J, 1:9) = .FALSE.
                    SUDOKU(PUZZLE, I, J) = 0

                    J = J - 1
                    IF (J == 0) THEN
                        J = 9
                        I = I - 1
                    END IF

                    DO WHILE (IS_FIXED_CELL(I, J))
                        J = J - 1
                        IF (J == 0) THEN
                            J = 9
                            I = I - 1
                        END IF
                    END DO

                ELSE
                    J = J + 1
                END IF

            END DO
            I = I + 1
        END DO
        SUM_VAL = SUM_VAL + (SUDOKU(PUZZLE, 1, 1) * 100) +                     &
                            (SUDOKU(PUZZLE, 1, 2) * 10)  +                     &
                            (SUDOKU(PUZZLE, 1, 3))
    END DO

    PRINT ('(I0)'), SUM_VAL

END PROGRAM F096

PROGRAM F028

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    INTEGER, PARAMETER :: N = 1001
    INTEGER, PARAMETER :: C = FLOOR(REAL(N) / 2.0) + 1

    INTEGER, DIMENSION(N, N) :: SPIRAL_ARRAY

    INTEGER :: I = C
    INTEGER :: J = C
    INTEGER :: K

    INTEGER :: SUM_VAL   = 0
    INTEGER :: COUNT_VAL = 2
    INTEGER :: MOVE_VAL  = 1
    INTEGER :: RIGHT_VAL = 1
    INTEGER :: DOWN_VAL  = 1

    LOGICAL :: GO_RIGHT  = .TRUE.

    SPIRAL_ARRAY(I, J) = 1

    DO WHILE (I > 1 .OR. J < (N - 1))

        IF (GO_RIGHT) THEN

            DO K = 1, MOVE_VAL
                J = J + RIGHT_VAL
                IF (J > N) EXIT
                SPIRAL_ARRAY(I, J) = COUNT_VAL
                COUNT_VAL = COUNT_VAL + 1
            END DO

            RIGHT_VAL = RIGHT_VAL * (-1)
            GO_RIGHT  = .FALSE.

        ELSE

            DO K = 1, MOVE_VAL
                I = I + DOWN_VAL
                SPIRAL_ARRAY(I, J) = COUNT_VAL
                COUNT_VAL = COUNT_VAL + 1
            END DO

            MOVE_VAL = MOVE_VAL + 1
            DOWN_VAL = DOWN_VAL * (-1)
            GO_RIGHT = .TRUE.

        END IF

    END DO

    DO I = 1, N
        SUM_VAL = SUM_VAL + SPIRAL_ARRAY(I, I) + SPIRAL_ARRAY(N-I+1, I)
    END DO

    SUM_VAL = SUM_VAL - SPIRAL_ARRAY(C, C)

    PRINT ('(I0)'), SUM_VAL

END PROGRAM F028

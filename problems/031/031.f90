PROGRAM F031

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    INTEGER :: COMBINATIONS = 0

    INTEGER :: I, J, K, L, M, N, O, P

    DO I = 0, 200, 200
        DO J = 0, 200, 100
            DO K = 0, 200, 50
                DO L = 0, 200, 20
                    DO M = 0, 200, 10
                        DO N = 0, 200, 5
                            DO O = 0, 200, 2
                                DO P = 0, 200, 1
                                    IF ((I + J + K + L + M + N + O + P) == 200) THEN
                                        COMBINATIONS = COMBINATIONS + 1
                                    END IF
                                END DO
                            END DO
                        END DO
                    END DO
                END DO
            END DO
        END DO
    END DO

    PRINT ('(I0)'), COMBINATIONS

END PROGRAM F031

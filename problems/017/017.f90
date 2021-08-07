PROGRAM F017

    ! Copyright 2021 Melwyn Francis Carlo

    IMPLICIT NONE

    INTEGER :: N = 0

    INTEGER, PARAMETER :: AND_STR_LENGTH          = 3
    INTEGER, PARAMETER :: HUNDRED_STR_LENGTH      = 7
    INTEGER, PARAMETER :: ONE_THOUSAND_STR_LENGTH = 11

    ! The first elements are dummy elements.
    INTEGER, PARAMETER, DIMENSION(0:9) :: ONES_STR_LENGTH    =                 &
    (/ 0, 3, 3, 5, 4, 4, 3, 5, 5, 4 /)

    INTEGER, PARAMETER, DIMENSION(0:9) :: TENS_STR_LENGTH    =                 &
    (/ 0, 3, 6, 6, 5, 5, 5, 7, 6, 6 /)

    INTEGER, PARAMETER, DIMENSION(0:9) :: ELEVENS_STR_LENGTH =                 &
    (/ 0, 6, 6, 8, 8, 7, 7, 9, 8, 8 /)

    INTEGER :: I, NUMBER_LENGTH, ONES_NUMBER, TENS_NUMBER

    DO I = 1, 999

        NUMBER_LENGTH = FLOOR(LOG10(REAL(I))) + 1
        ONES_NUMBER   = MOD(I, 10)
        TENS_NUMBER   = MOD(FLOOR(REAL(I) / 10.0), 10)

        IF (NUMBER_LENGTH > 2) THEN

            N = N                                                              &
              + ONES_STR_LENGTH(FLOOR(REAL(I) / 100.0))                        &
              + HUNDRED_STR_LENGTH

            IF (ONES_NUMBER > 0 .OR. TENS_NUMBER > 0) N = N + AND_STR_LENGTH

        END IF

        IF (NUMBER_LENGTH > 1) THEN

            IF (TENS_NUMBER == 1) THEN

                IF (ONES_NUMBER == 0) THEN
                    N = N + TENS_STR_LENGTH(1)
                ELSE
                    N = N + ELEVENS_STR_LENGTH(ONES_NUMBER)
                END IF

                CYCLE

            ELSE
                N = N + TENS_STR_LENGTH(TENS_NUMBER)
            END IF

        END IF

        N = N + ONES_STR_LENGTH(ONES_NUMBER)

    END DO

    N = N + ONE_THOUSAND_STR_LENGTH

    PRINT ('(I0)'), N

END PROGRAM F017

      *****************************************************************
      *                RMNTODEC.CBL - Roman to Decimal                *
      *                Copyright (C) 2022 RAPHAEL FREI                *
      *                     All Rights Reserved                       *
      *           LinkedIn: linkedin.com/in/raphaelrfrei/             *
      *           GitHub: https://github.com/raphaelfrei/             *
      *****************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. RMNTODEC.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-ROMAN                 PIC X(09) VALUE SPACES.
       77 WS-NUMERIC               PIC 9(04) VALUE ZEROES.

       77 WS-QTDDGT                PIC 9(02).
       77 WS-STATUS                PIC X(01).
       77 WS-CURDGT                PIC X(01).

       77 WS-COUNT-2               PIC 9(01) VALUE 0.

       PROCEDURE DIVISION.
       P-MAIN.

            INITIALISE WS-ROMAN
                       WS-NUMERIC

            DISPLAY
            "**********************************************************"
            DISPLAY
            "*                                                        *"
            DISPLAY
            "*               ROMAN TO DECIMAL CONVERTER               *"
            DISPLAY
            "*              The app does not feature '_'              *"
            DISPLAY
            "*                                                        *"
            DISPLAY
            "**********************************************************"

            DISPLAY " "

            DISPLAY
            "Insert a value to convert: (9 digits-max)"

            ACCEPT WS-ROMAN

            PERFORM P-CALC THRU P-CALC-END.

       P-MAIN-END.

       P-CALC.

            COMPUTE WS-COUNT-2 = 1

            PERFORM 9 TIMES
               MOVE WS-ROMAN(WS-COUNT-2:1) TO WS-CURDGT

               EVALUATE WS-CURDGT
                   WHEN 'M'
                       COMPUTE WS-NUMERIC = WS-NUMERIC + 1000

                   WHEN 'D'
                       COMPUTE WS-NUMERIC = WS-NUMERIC + 500

                   WHEN 'C'
                       COMPUTE WS-NUMERIC = WS-NUMERIC + 100

                   WHEN 'L'
                       COMPUTE WS-NUMERIC = WS-NUMERIC + 50

                   WHEN 'X'
                       COMPUTE WS-NUMERIC = WS-NUMERIC + 10

                   WHEN 'V'
                       COMPUTE WS-NUMERIC = WS-NUMERIC + 5

                   WHEN 'I'
                       COMPUTE WS-NUMERIC = WS-NUMERIC + 1


                   WHEN 'm'
                       COMPUTE WS-NUMERIC = WS-NUMERIC + 1000

                   WHEN 'd'
                       COMPUTE WS-NUMERIC = WS-NUMERIC + 500

                   WHEN 'c'
                       COMPUTE WS-NUMERIC = WS-NUMERIC + 100

                   WHEN 'l'
                       COMPUTE WS-NUMERIC = WS-NUMERIC + 50

                   WHEN 'x'
                       COMPUTE WS-NUMERIC = WS-NUMERIC + 10

                   WHEN 'v'
                       COMPUTE WS-NUMERIC = WS-NUMERIC + 5

                   WHEN 'i'
                       COMPUTE WS-NUMERIC = WS-NUMERIC + 1

                   WHEN OTHER
                       COMPUTE WS-NUMERIC = WS-NUMERIC + 0

               END-EVALUATE

               ADD 1 TO WS-COUNT-2

            END-PERFORM.

            PERFORM P-END

            .
       P-CALC-END.

       P-END.

            DISPLAY
            " "
            DISPLAY
            "**********************************************************"
            DISPLAY
            " "
            DISPLAY
            "The result is: " WS-NUMERIC

            DISPLAY
            "**********************************************************"
            DISPLAY
            "*                                                        *"
            DISPLAY
            "*              DO YOU WANT TO CONVERT AGAIN              *"
            DISPLAY
            "*                    Y(yes)\OTHER(no)                    *"
            DISPLAY
            "*                                                        *"
            DISPLAY
            "**********************************************************"

            ACCEPT WS-STATUS

            EVALUATE WS-STATUS
               WHEN "Y"
                   PERFORM P-MAIN THRU P-MAIN-END
               WHEN "y"
                   PERFORM P-MAIN THRU P-MAIN-END
               WHEN OTHER
                   STOP RUN
            END-EVALUATE

            STOP RUN.
       END PROGRAM RMNTODEC.

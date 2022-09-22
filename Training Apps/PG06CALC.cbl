      ******************************************************************
      * Author: Raphael Frei
      * Date: 28/06/2022
      * Purpose:
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PG06CALC.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-N1        PIC 9(03) VALUE ZEROS.
       77 WS-N2        PIC 9(03) VALUE ZEROS.
       77 WS-RS        PIC 9(07) VALUE ZEROS.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "INSIRA O PRIMEIRO NUMERO: "
            ACCEPT WS-N1

            DISPLAY "INSIRA O SEGUNDO NUMERO: "
            ACCEPT WS-N2

            COMPUTE WS-RS = WS-N1 * WS-N2
            DISPLAY "O RESULTADO E: " WS-RS

            INITIALISE WS-RS REPLACING NUMERIC BY ZERO.

            DISPLAY "O RESULTADO APOS INITIALISE E: " WS-RS.

            STOP RUN.
       END PROGRAM PG06CALC.

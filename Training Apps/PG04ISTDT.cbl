      ******************************************************************
      * Author: Raphael Frei
      * Date: 16/06/2022
      * Purpose: Display user input
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-DATA      PIC X(10) VALUE SPACES.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "INSIRA UM VALOR: "
            ACCEPT WS-DATA

            DISPLAY " "
            DISPLAY "O VALOR INSERIDO FOI: "
            DISPLAY WS-DATA

            ACCEPT WS-DATA
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.

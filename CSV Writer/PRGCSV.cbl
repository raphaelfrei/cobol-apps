      ******************************************************************
      * Author:  Raphael Frei
      * Date:    15/07/2022
      * Purpose: Gerar Relatório CSV
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRGCSV.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
            SELECT CSV ASSIGN TO ".\CTT_CSV.CSV"
                                 ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.

       FILE SECTION.
       FD CSV.
       01 REG-CSV              PIC X(70).

       WORKING-STORAGE SECTION.

       77 WS-NAME-F            PIC X(10).
       77 WS-NAME-L            PIC X(10).
       77 WS-EMAIL             PIC X(30).
       77 WS-TEL               PIC 9(13).

       77 WS-STATUS            PIC X(01).

       PROCEDURE DIVISION.

       P-MAIN.
            DISPLAY
            "********************************************************"
            DISPLAY
            "*                 Cadastro de Usuarios                 *"
            DISPLAY
            "********************************************************"

            MOVE 'I'           TO WS-STATUS

            DISPLAY " "
            DISPLAY " "

            OPEN OUTPUT CSV

            PERFORM UNTIL WS-STATUS = 'F' OR WS-STATUS = 'f'

            INITIALISE WS-NAME-F
                       WS-NAME-L
                       WS-EMAIL
                       WS-TEL

            DISPLAY "Insira o Nome: "
            ACCEPT WS-NAME-F

            DISPLAY "Insira o Sobrenome: "
            ACCEPT WS-NAME-L

            DISPLAY "Insira o Email: "
            ACCEPT WS-EMAIL

            DISPLAY "Insira o Telefone: "
            "(Numerico apenas ex: 5511988888888)"
            ACCEPT WS-TEL

            STRING FUNCTION TRIM(WS-NAME-F)   DELIMITED BY SIZE
                   ' '                        DELIMITED BY SIZE
                   FUNCTION TRIM(WS-NAME-L)   DELIMITED BY SIZE
                   ','                        DELIMITED BY SIZE
                   FUNCTION TRIM(WS-EMAIL)    DELIMITED BY SIZE
                   ','                        DELIMITED BY SIZE
                   '+'                        DELIMITED BY SIZE
                   FUNCTION TRIM(WS-TEL(1:2)) DELIMITED BY SIZE
                   ' '                        DELIMITED BY SIZE
                   '('                        DELIMITED BY SIZE
                   FUNCTION TRIM(WS-TEL(3:2)) DELIMITED BY SIZE
                   ')'                        DELIMITED BY SIZE
                   ' '                        DELIMITED BY SIZE
                   FUNCTION TRIM(WS-TEL(5:1)) DELIMITED BY SIZE
                   '.'                        DELIMITED BY SIZE
                   FUNCTION TRIM(WS-TEL(6:4)) DELIMITED BY SIZE
                   ' '                        DELIMITED BY SIZE
                   FUNCTION TRIM(WS-TEL(10:)) DELIMITED BY SIZE

                   INTO REG-CSV

            END-STRING

            WRITE REG-CSV

            DISPLAY '<F> para sair'
            DISPLAY '<OUTRO> para continuar'
            ACCEPT WS-STATUS

            END-PERFORM

            CLOSE CSV
            STOP RUN.
       END PROGRAM PRGCSV.

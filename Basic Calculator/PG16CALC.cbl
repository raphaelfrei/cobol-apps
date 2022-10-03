      ******************************************************************
      * Author:  Conversando em Códigos
      * Date:    22/06/2022
      * Purpose: Criando uma Cálculadora em COBOL
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PG16CALC.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-MODO                  PIC X(01).

       77 WS-NUM-1                 PIC 9(02).
       77 WS-NUM-2                 PIC 9(02).

       77 WS-RESULT                PIC 9(03).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            INITIALISE WS-MODO
                       WS-NUM-1
                       WS-NUM-2
                       WS-RESULT

            DISPLAY "*************************************************"
            DISPLAY "Selecione o modo que deseja:"
            DISPLAY "<1> para somar"
            DISPLAY "<2> para subtrair"
            DISPLAY "<3> para dividir"
            DISPLAY "<4> para multiplicar"
            DISPLAY "*************************************************"
            ACCEPT WS-MODO

            DISPLAY "Insira o primeiro numero:"
            ACCEPT WS-NUM-1

            DISPLAY "Insira o segundo numero:"
            ACCEPT WS-NUM-2


            EVALUATE WS-MODO
                   WHEN "1"
                       PERFORM PROC-SOMAR
                               THRU PROC-SOMAR-END
                   WHEN "2"
                       PERFORM PROC-SUBTRAIR
                               THRU PROC-SUBTRAIR-END
                   WHEN "3"
                       PERFORM PROC-DIVIDIR
                               THRU PROC-DIVIDIR-END
                   WHEN "4"
                       PERFORM PROC-MULTIPLICAR
                               THRU PROC-MULTIPLICAR-END
                   WHEN OTHER
                       DISPLAY "Valor Invalido!"
                       PERFORM MAIN-PROCEDURE
                               THRU MAIN-PROCEDURE-END
            END-EVALUATE

            DISPLAY "*************************************************"
            DISPLAY "Voce deseja continuar?"
            DISPLAY "<S> para continuar"
            DISPLAY "<QUALQUER TECLA> para sair"
            DISPLAY "*************************************************"
            ACCEPT WS-MODO

            EVALUATE WS-MODO
                   WHEN "S"
                       PERFORM MAIN-PROCEDURE
                               THRU MAIN-PROCEDURE-END
                   WHEN "s"
                       PERFORM MAIN-PROCEDURE
                               THRU MAIN-PROCEDURE-END
                   WHEN OTHER
                       PERFORM PROC-ENCERRAR

            END-EVALUATE

            .
       MAIN-PROCEDURE-END.

       PROC-SOMAR.
            COMPUTE WS-RESULT = WS-NUM-1 + WS-NUM-2

            DISPLAY "A soma de " WS-NUM-1 " + " WS-NUM-2
                    " e : " WS-RESULT
            .
       PROC-SOMAR-END.

       PROC-SUBTRAIR.
            COMPUTE WS-RESULT = WS-NUM-1 - WS-NUM-2

            DISPLAY "A subtracao de " WS-NUM-1 " + " WS-NUM-2
                    " e: " WS-RESULT
            .
       PROC-SUBTRAIR-END.

       PROC-DIVIDIR.
            COMPUTE WS-RESULT = WS-NUM-1 / WS-NUM-2

            DISPLAY "A divisao de " WS-NUM-1 " + " WS-NUM-2
                    " e: " WS-RESULT
            .
       PROC-DIVIDIR-END.

       PROC-MULTIPLICAR.
            COMPUTE WS-RESULT = WS-NUM-1 * WS-NUM-2

            DISPLAY "A multiplicacao de " WS-NUM-1 " + " WS-NUM-2
                    " e: " WS-RESULT
            .
       PROC-MULTIPLICAR-END.

       PROC-ENCERRAR.
            STOP RUN.
       END PROGRAM PG16CALC.

      ******************************************************************
      * Author:  Raphael Frei
      * Date:    30/06/2022
      * Purpose: Verifica os dois digitos finais do CPF
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CPF_CALC.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-CPF           PIC 9(09) VALUE ZEROES.
       77 WS-CPF-MSK       PIC ZZZ.ZZZ.ZZ9.

       77 WS-QTDDGT        PIC 9(01) VALUE ZEROES.

       77 WS-STATUS        PIC X(01) VALUE ZEROES.

       77 WS-CALC-1        PIC 9(03) VALUE ZEROES.
       77 WS-CALC-2        PIC 9(03) VALUE ZEROES.
       77 WS-CURDGT        PIC 9(01) VALUE ZEROES.

       77 WS-COUNT         PIC 9(01) VALUE 9.
       77 WS-COUNT-2       PIC 9(01) VALUE 0.

       77 WS-FILLER        PIC 9(01) VALUE ZEROES.

       PROCEDURE DIVISION.
       P-MAIN.

            INITIALISE WS-CPF
                       WS-CALC-1
                       WS-CALC-2

            DISPLAY
             "*********************************************************"
            DISPLAY
             "*              CALCULADOR DE DIGITOS DO CPF             *"
            DISPLAY
             "*********************************************************"
            DISPLAY
             "Insira os 9 primeiros digitos do CPF:"

            ACCEPT WS-CPF

            PERFORM P-VALIDA THRU P-VALIDA-FIM
            .
       P-MAIN-END.

       P-VALIDA.

            INSPECT WS-CPF TALLYING
               WS-QTDDGT FOR CHARACTERS
                   BEFORE INITIAL ZEROES.

      *      IF WS-QTDDGT NOT EQUAL 9 THEN
      *          COMPUTE WS-STATUS = WS-STATUS + 1

      *      IF WS-STATUS NOT EQUAL 0 THEN
      *          PERFORM P-ERRO THRU P-ERRO-FIM

            PERFORM P-CALC-1 THRU P-CALC-1-FIM

           .
       P-VALIDA-FIM.

       P-ERRO.

       P-ERRO-FIM.

       P-CALC-1.
            COMPUTE WS-COUNT   = 9
            COMPUTE WS-COUNT-2 = 1.

            PERFORM 9 TIMES

               MOVE WS-CPF(WS-COUNT-2:1) TO WS-CURDGT

               COMPUTE WS-CALC-1 = WS-CALC-1 +
                                           (WS-CURDGT * (WS-COUNT + 1))

               SUBTRACT 1 FROM WS-COUNT
               ADD 1 TO WS-COUNT-2

            END-PERFORM.

            DIVIDE WS-CALC-1 BY 11 GIVING WS-FILLER REMAINDER WS-CALC-1.

            COMPUTE WS-CALC-1 = 11 - WS-CALC-1.

            IF WS-CALC-1 > 9
                THEN COMPUTE WS-CALC-1 = 0.

            PERFORM P-CALC-2 THRU P-CALC-2-FIM
           .
       P-CALC-1-FIM.

       P-CALC-2.

            COMPUTE WS-COUNT   = 9
            COMPUTE WS-COUNT-2 = 1

            PERFORM 9 TIMES

               MOVE WS-CPF(WS-COUNT-2:1) TO WS-CURDGT

               COMPUTE WS-CALC-2 = WS-CALC-2 +
                                           (WS-CURDGT * (WS-COUNT + 2))

               SUBTRACT 1 FROM WS-COUNT
               ADD 1 TO WS-COUNT-2

            END-PERFORM.

            MOVE WS-CALC-1 TO WS-CURDGT.

            COMPUTE WS-CALC-2 = WS-CALC-2 +
                                        (WS-CURDGT * (WS-COUNT + 2)).

            DIVIDE WS-CALC-2 BY 11 GIVING WS-CALC-2 REMAINDER WS-CALC-2.

            COMPUTE WS-CALC-2 = 11 - WS-CALC-2.

            IF WS-CALC-2 > 9
                THEN COMPUTE WS-CALC-2 = 0.

            PERFORM P-ENCERRA THRU P-ENCERRA-FIM
           .
       P-CALC-2-FIM.

       P-ENCERRA.
            MOVE WS-CPF TO WS-CPF-MSK.

            DISPLAY
             "*********************************************************"
            DISPLAY
             "*     "WS-CPF-MSK "-" WS-CALC-1(3:) WS-CALC-2(3:)"      *"
            DISPLAY
             "*********************************************************"
            DISPLAY "O resultado e: " WS-CPF-MSK "-"
                                      WS-CALC-1(3:) WS-CALC-2(3:)


            DISPLAY " "
            DISPLAY " "
            DISPLAY "Voce deseja calcular novamente?"
            DISPLAY "<S> para calcular"
            DISPLAY "<QUALQUER TECLA> para sair"

            ACCEPT WS-STATUS

            EVALUATE WS-STATUS
               WHEN "S"
                   PERFORM P-MAIN THRU P-MAIN-END
               WHEN "s"
                   PERFORM P-MAIN THRU P-MAIN-END
               WHEN OTHER
                   STOP RUN
            END-EVALUATE.

            STOP RUN.
       P-ENCERRA-FIM.

       END PROGRAM CPF_CALC.

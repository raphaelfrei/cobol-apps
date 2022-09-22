      ******************************************************************
      * Author: Raphael Frei
      * Date: 19/06/2022
      * Purpose: Gravação Sequencial - Alteração de Contatos
      * Update: 20/06/2022 - Conversão para Módulo
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PG13ALTCNT.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       SPECIAL-NAMES.
            DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
            SELECT CONTATOS ASSIGN TO
                 '.\CONTATOS.dat'
                 ORGANISATION IS INDEXED
                 ACCESS  MODE IS RANDOM
                 RECORD   KEY IS ID-CONTATO
                 FILE  STATUS IS WS-FS.

       DATA DIVISION.

       FILE SECTION.
       FD CONTATOS.
          COPY FD_CONTT.

       WORKING-STORAGE SECTION.
       01 WS-REGISTRO          PIC X(22) VALUE SPACES.

       01 FILLER REDEFINES WS-REGISTRO.
          03 WS-ID-CONTATO     PIC 9(02).
          03 WS-NM-CONTATO     PIC X(20).

       77 WS-FS                PIC 9(02).
          88 FS-OK           VALUE 0.

       77 WS-EOF               PIC X.
          88 EOF-OK          VALUE 'S' FALSE 'N'.

       77 WS-EXIT              PIC X.
          88 EXIT-OK         VALUE 'N' FALSE 'S'.

       77 WS-CONFIRM           PIC X(01) VALUE SPACE.

       LINKAGE SECTION.
       01 LK-COM-AREA.
          03 LK-MENSAGEM       PIC X(20).

       PROCEDURE DIVISION USING LK-COM-AREA.
       MAIN-PROCEDURE.
            DISPLAY "***** ALTERAR CONTATOS *****"

            SET EXIT-OK OF WS-EXIT TO FALSE.

            PERFORM P-CHANGE THRU P-CHANGE-END UNTIL EXIT-OK
            PERFORM P-END
           .

       P-CHANGE.
            SET  EOF-OK            TO FALSE
            SET  FS-OK             TO TRUE
            MOVE SPACES            TO WS-CONFIRM

            OPEN I-O CONTATOS

            IF FS-OK THEN

               DISPLAY 'Informe o ID: '
               ACCEPT ID-CONTATO


               READ CONTATOS INTO WS-REGISTRO
                    KEY IS ID-CONTATO
                    INVALID KEY
                        DISPLAY "CONTATO NAO EXISTE!"
                NOT INVALID KEY
                        DISPLAY 'Nome atual: ' WS-NM-CONTATO
                        DISPLAY 'Informe o novo nome: '
                        ACCEPT  NM-CONTATO

                        DISPLAY "Voce deseja continuar?"
                        DISPLAY "<S> para confirmar, "
                                "<QUALQUER TECLA> para sair."
                        ACCEPT WS-CONFIRM

                        IF WS-CONFIRM EQUAL 'S' THEN
                           REWRITE REG-CONTATOS
                           DISPLAY "Contato Atualizado!"
                        ELSE
                           DISPLAY "Operacao nao realizada"
                        END-IF


               END-READ

            ELSE
               DISPLAY "ERRO AO GRAVAR O ARQUIVO."
               DISPLAY "Error ID: " WS-FS

            END-IF

            CLOSE CONTATOS

            DISPLAY "Voce deseja continuar?"
            DISPLAY "<QUALQUER TECLA> para continuar, <N> para sair."
            ACCEPT WS-EXIT
            .

       P-CHANGE-END.

       P-END.
            GOBACK.
       END PROGRAM PG13ALTCNT.

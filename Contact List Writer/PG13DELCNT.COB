      ******************************************************************
      * Author: Raphael Frei
      * Date: 19/06/2022
      * Purpose: Gravação Sequencial - Deletar Contatos
      * Update: 20/06/2022 - Conversão para Módulo
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PG13DELCNT.

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
            DISPLAY "***** DELETAR CONTATOS *****"

            SET EXIT-OK OF WS-EXIT TO FALSE.

            PERFORM P-DELETE THRU P-DELETE-END UNTIL EXIT-OK
            PERFORM P-END
           .

       P-DELETE.
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
                        DISPLAY 'Contato: ' WS-NM-CONTATO

                        DISPLAY "Voce deseja continuar?"
                        DISPLAY "<S> para confirmar, "
                                "<QUALQUER TECLA> para abortar."
                        ACCEPT WS-CONFIRM

                        IF WS-CONFIRM EQUAL 'S' THEN
                           DELETE CONTATOS RECORD
                           DISPLAY "Contato Excluido!"
                        ELSE
                           DISPLAY "Operacao Abortada"
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

       P-DELETE-END.

       P-END.
            GOBACK.
       END PROGRAM PG13DELCNT.

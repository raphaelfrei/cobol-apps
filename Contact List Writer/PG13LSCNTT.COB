      ******************************************************************
      * Author: Raphael Frei
      * Date: 19/06/2022
      * Purpose: Gravação Sequencial - Leitura de Contatos
      * Update: 20/06/2022 - Conversão para Módulo
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PG13LSCNTT.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       SPECIAL-NAMES.
            DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
            SELECT CONTATOS ASSIGN TO
                 '.\CONTATOS.dat'
                 ORGANISATION IS INDEXED
      *          ALTERA DE RANDOM PARA SEQUENTIAL
                 ACCESS  MODE IS SEQUENTIAL
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

       77 WS-CONT              PIC 9(03) VALUE ZEROS.

       LINKAGE SECTION.
       01 LK-COM-AREA.
          03 LK-MENSAGEM       PIC X(20).

       PROCEDURE DIVISION USING LK-COM-AREA.
       MAIN-PROCEDURE.
            DISPLAY "***** LEITURA DE CONTATOS *****"

            SET EXIT-OK OF WS-EXIT TO FALSE.

            PERFORM P-LIST THRU P-LIST-END
            PERFORM P-END
           .

       P-LIST.
            SET EOF-OK             TO FALSE
            SET FS-OK              TO TRUE
            SET WS-CONT            TO ZERO

            OPEN INPUT CONTATOS

            PERFORM UNTIL EOF-OK
                IF FS-OK THEN
                   READ CONTATOS INTO WS-REGISTRO
                        AT END
                           SET EOF-OK TO TRUE
                    NOT AT END
                           ADD 1      TO WS-CONT
                           DISPLAY 'Registro: ' WS-CONT
                                   ': ' WS-ID-CONTATO
                                   ' - ' WS-NM-CONTATO
                   END-READ
                ELSE
                    DISPLAY 'ERRO AO ABRIR O ARQUIVO DE CONTATOS!'
                    DISPLAY 'Error Code: ' WS-FS
                END-IF

            END-PERFORM

            CLOSE CONTATOS
            .

       P-LIST-END.

       P-END.
            GOBACK.
       END PROGRAM PG13LSCNTT.

      ******************************************************************
      * Author: Raphael Frei
      * Date: 19/06/2022
      * Purpose: Gravação Sequencial - Cadastro de Contatos
      * PRIMEIRO PASSO -----------------------------------------------
      * Update: 20/06/2022 - Conversão para Módulo
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PG13CADCTT.

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

      * SEGUNDO PASSO ------------------------------------------------
       LINKAGE SECTION.
      * TERCEIRO PASSO -----------------------------------------------
       01 LK-COM-AREA.
          03 LK-MENSAGEM       PIC X(20).

      * QUARTO PASSO -------------------------------------------------
       PROCEDURE DIVISION USING LK-COM-AREA.
       MAIN-PROCEDURE.
            DISPLAY "***** CADASTRO DE CONTATOS *****"

            SET EXIT-OK OF WS-EXIT TO FALSE.

            PERFORM P-REGISTER THRU P-REGISTER-END UNTIL EXIT-OK
            PERFORM P-END
           .

       P-REGISTER.
            SET EOF-OK             TO FALSE
            SET FS-OK              TO TRUE

            DISPLAY "PARA REGISTRAR UM CONTATO, INFORME: "

            DISPLAY "ID: "
            ACCEPT  WS-ID-CONTATO

            DISPLAY "Nome: "
            ACCEPT  WS-NM-CONTATO

            OPEN I-O CONTATOS

            IF WS-FS EQUAL 35 THEN
               OPEN OUTPUT CONTATOS
            END-IF

            IF FS-OK THEN
               MOVE WS-ID-CONTATO      TO ID-CONTATO
               MOVE WS-NM-CONTATO      TO NM-CONTATO

               WRITE REG-CONTATOS
                     INVALID KEY
                         DISPLAY "CONTATO JA CADASTRADO!"
                 NOT INVALID KEY
                         DISPLAY "CONTATO GRAVADO COM SUCESSO!"

            ELSE
               DISPLAY "ERRO AO GRAVAR O ARQUIVO."
               DISPLAY "Error ID: " WS-FS

            END-IF

            CLOSE CONTATOS

            DISPLAY "Voce deseja continuar?"
            DISPLAY "<QUALQUER TECLA> para continuar, <N> para sair."
            ACCEPT WS-EXIT
            .

       P-REGISTER-END.

       P-END.
      * QUINTO PASSO -------------------------------------------------
            GOBACK.
       END PROGRAM PG13CADCTT.

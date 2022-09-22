      ****************************************************************
      * Author: Raphael Frei
      * Date: 19/06/2022
      * Purpose: Cálculo de Média
      ****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PG08MEDIA.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       77 WS-NOME-ALUNO       PIC X(15).
       77 WS-I                PIC 9(01).
       77 WS-RPT              PIC X(01).

       01 WS-MATERIA.
          02 WS-NOME-MATERIA  PIC X(10).
          02 WS-MEDIA         PIC 9(02)V99.
          02 WS-RESULTADO     PIC X(10).
          02 WS-NOTA-1        PIC 9(02).
          02 WS-NOTA-2        PIC 9(02).
          02 WS-NOTA-3        PIC 9(02).
          02 WS-NOTA-4        PIC 9(02).

       PROCEDURE DIVISION.
       P-START.

            INITIALISE WS-MATERIA
                       WS-NOME-ALUNO
                       WS-I.

            DISPLAY "INSIRA O NOME DO ALUNO: "
            ACCEPT WS-NOME-ALUNO.

            DISPLAY "INSIRA A MATERIA: "
            ACCEPT WS-NOME-MATERIA OF WS-MATERIA

            PERFORM P-DEFINE-NOTAS    THRU P-DEFINE-NOTAS-FIM
                    4 TIMES.

            PERFORM P-CALCULA         THRU P-CALCULA-FIM.

            PERFORM P-REPETE          THRU P-REPETE-FIM.

       P-START-END.

       P-DEFINE-NOTAS.
            ADD 1 TO WS-I.

            DISPLAY "INSIRA A " WS-I "A NOTA: ".

            EVALUATE TRUE
                WHEN WS-I EQUAL 1
                     ACCEPT WS-NOTA-1 OF WS-MATERIA
                WHEN WS-I EQUAL 2
                     ACCEPT WS-NOTA-2 OF WS-MATERIA
                WHEN WS-I EQUAL 3
                     ACCEPT WS-NOTA-3 OF WS-MATERIA
                WHEN WS-I EQUAL 4
                     ACCEPT WS-NOTA-4 OF WS-MATERIA
            END-EVALUATE.


       P-DEFINE-NOTAS-FIM.

       P-VALIDA-NOTAS.

            IF WS-NOTA-1 IS <= 0
                         OR WS-NOTA-1 IS NOT NUMERIC
                         OR WS-NOTA-1 IS >= 10
                DISPLAY '***************************************'
                DISPLAY '*   NOTAS INVALIDAS TENTE NOVAMENTE   *'
                DISPLAY '***************************************'
                PERFORM P-START THRU P-START-END
            END-IF.

            IF WS-NOTA-2 IS <= 0
                         OR WS-NOTA-2 IS NOT NUMERIC
                         OR WS-NOTA-2 IS >= 10
                DISPLAY '***************************************'
                DISPLAY '*   NOTAS INVALIDAS TENTE NOVAMENTE   *'
                DISPLAY '***************************************'
                PERFORM P-START THRU P-START-END
            END-IF.

            IF WS-NOTA-3 IS <= 0
                         OR WS-NOTA-3 IS NOT NUMERIC
                         OR WS-NOTA-3 IS >= 10
                DISPLAY '***************************************'
                DISPLAY '*   NOTAS INVALIDAS TENTE NOVAMENTE   *'
                DISPLAY '***************************************'
                PERFORM P-START THRU P-START-END
            END-IF.

            IF WS-NOTA-4 IS <= 0
                         OR WS-NOTA-4 IS NOT NUMERIC
                         OR WS-NOTA-4 IS >= 10
                DISPLAY '***************************************'
                DISPLAY '*   NOTAS INVALIDAS TENTE NOVAMENTE   *'
                DISPLAY '***************************************'
                PERFORM P-START THRU P-START-END
            END-IF.

       P-VALIDA-NOTAS-FIM.

       P-CALCULA.

            PERFORM P-VALIDA-NOTAS    THRU P-VALIDA-NOTAS-FIM.

            COMPUTE WS-MEDIA OF WS-MATERIA =
                   (WS-NOTA-1 OF WS-MATERIA + WS-NOTA-2 OF WS-MATERIA
                   + WS-NOTA-3 OF WS-MATERIA + WS-NOTA-4 OF WS-MATERIA)
                   / 4.

            IF WS-MEDIA GREATER THAN OR EQUAL 7 THEN
                MOVE 'APROVADO' TO WS-RESULTADO
            ELSE
                MOVE 'REPROVADO' TO WS-RESULTADO
            END-IF.

            DISPLAY '****** RESULTADO DO PROCESSAMENTO ******'
            DISPLAY 'NOME DO ALUNO: ' FUNCTION TRIM(WS-NOME-ALUNO)
            DISPLAY 'MATERIA      : ' FUNCTION TRIM(WS-NOME-MATERIA)
            DISPLAY 'MEDIA        : ' WS-MEDIA
            DISPLAY 'RESULTADO    : ' FUNCTION TRIM(WS-RESULTADO)
            DISPLAY '****************************************'.

       P-CALCULA-FIM.

       P-REPETE.
            DISPLAY 'REPETIR OPERACAO? (Y/N)'
            ACCEPT WS-RPT

            IF WS-RPT IS EQUAL 'Y' OR WS-RPT IS EQUAL 'y'
                PERFORM P-START THRU P-START-END.

            IF WS-RPT IS EQUAL 'N' OR WS-RPT IS EQUAL 'n'
                PERFORM P-ENCERRA THRU P-ENCERRA-FIM.

       P-REPETE-FIM.

       P-ENCERRA.
           STOP RUN.
       P-ENCERRA-FIM.
       END PROGRAM PG08MEDIA.

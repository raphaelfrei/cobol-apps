      ******************************************************************
      * Author: Raphael Frei
      * Date: 20/06/2022
      * Purpose: Menu Principal para o Cadastro de Contatos
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PG13MENU.
       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
       01 WS-COM-AREA.
          03 WS-MENSAGEM               PIC X(20).

       77 WS-OPCAO                     PIC X.

       PROCEDURE DIVISION.
       P-START.

            MOVE SPACES                TO WS-OPCAO.

            DISPLAY ' ****** MENU PRINCIPAL ****** '
            DISPLAY '<1> para Cadastro'
            DISPLAY '<2> para Listar'
            DISPLAY '<3> para Consultar'
            DISPLAY '<4> para Alterar'
            DISPLAY '<5> para Excluir'
            DISPLAY '<QUALQUER TECLA> para Sair'
            ACCEPT WS-OPCAO

            EVALUATE WS-OPCAO
                WHEN '1'
                   CALL 'D:\Código\Cobol\bin\PG13CADCTT'
                                       USING WS-COM-AREA
                   PERFORM P-START THRU P-START-END
                WHEN '2'
                   CALL 'D:\Código\Cobol\bin\PG13LSCNTT'
                                       USING WS-COM-AREA
                   PERFORM P-START THRU P-START-END
                WHEN '3'
                   CALL 'D:\Código\Cobol\bin\PG13CONSCTT'
                                       USING WS-COM-AREA
                   PERFORM P-START THRU P-START-END
                WHEN '4'
                   CALL 'D:\Código\Cobol\bin\PG13ALTCNT'
                                       USING WS-COM-AREA
                   PERFORM P-START THRU P-START-END
                WHEN '5'
                   CALL 'D:\Código\Cobol\bin\PG13DELCNT'
                                       USING WS-COM-AREA
                   PERFORM P-START THRU P-START-END
                WHEN OTHER
                   DISPLAY 'Saindo...'
                   PERFORM P-END
            END-EVALUATE

            .
       P-START-END.

       P-END.
            STOP RUN.
       END PROGRAM PG13MENU.

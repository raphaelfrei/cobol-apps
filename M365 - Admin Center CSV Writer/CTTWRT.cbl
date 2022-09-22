      *****************************************************************
      *                CTTWRT.CBL - a COBOL CSV WRITER                *
      *                Copyright (C) 2022 RAPHAEL FREI                *
      *                     All Rights Reserved                       *
      *           LinkedIn: linkedin.com/in/raphaelrfrei/             *
      *           GitHub: https://github.com/raphaelfrei/             *
      *****************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. CTTWRT.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT CSV-OTPT ASSIGN TO ".\OTPT.CSV"
                                       ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD CSV-OTPT.
       01 REG-CSV                      PIC X(300).

       WORKING-STORAGE SECTION.

      ******************************************************************
      *     The record length is 283 bytes (297 with ',')
      *     COLUMN A: FULL NAME                    (41 | B + " " + C)
      *     COLUMN B: FIRST NAME                   (10)
      *     COLUMN C: LAST NAME                    (30)
      *     COLUMN D: EMAIL                        (30)
      *     COLUMN E: COMPANY                      (30)
      *     COLUMN F: TELEPHONE - COMMERCIAL       (10)
      *     COLUMN G: TELEPHONE - CELULAR          (11)
      *     COLUMN H: FAX NUMBER                   (10)
      *     COLUMN I: TITLE - (IN COMPANY)         (20)
      *     COLUMN J: SITE                         (30)
      *     COLUMN K: ADDRESS                      (30)
      *     COLUMN L: ADDRESS 2                    (30)
      *     COLUMN M: CITY                         (20)
      *     COLUMN N: STATE                        (02)
      *     COLUMN O: POSTAL CODE                  (10)
      *     COLUMN P: COUNTRY                      (10)
      ******************************************************************

       01 WS-CUST-RECORD.
          03 WS-CUST-NM.
             05 WS-CUST-NM-FL          PIC A(41).
             05 WS-CUST-NM-FN          PIC A(10).
             05 WS-CUST-NM-LN          PIC A(30).

          03 WS-CUST-EML               PIC X(30).
          03 WS-CUST-CMP               PIC X(30).

          03 WS-CUST-TLF-CMR.
             05 WS-CUST-TLF            PIC 99.9999.9999.

          03 WS-CUST-TLF-CLR.
             05 WS-CUST-TLF            PIC 99.99999.9999.

          03 WS-CUST-FAX.
             05 WS-CUST-TLF            PIC 99.9999.9999.

          03 WS-CUST-TTL               PIC X(20).
          03 WS-CUST-STE               PIC X(30).

          03 WS-CUST-ADR-1             PIC X(30).
          03 WS-CUST-ADR-2             PIC X(30).
          03 WS-CUST-CTY               PIC X(20).
          03 WS-CUST-STT               PIC X(02).

          03 WS-CUST-PTC.
             05 WS-CUST-PST            PIC 99999.999.

          03 WS-CUST-CRT               PIC X(10).


       77 WS-EOF                   PIC X(01) VALUE SPACE.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            DISPLAY
            "**********************************************************"
            DISPLAY
            "*         CSV WRITER BY (C)RAPHAEL FREI - 2022           *"
            DISPLAY
            "**********************************************************"

            MOVE 'I'                   TO WS-EOF

            OPEN OUTPUT CSV-OTPT

            PERFORM UNTIL WS-EOF = 'F'

            DISPLAY "Insert the First Name: "
            ACCEPT WS-CUST-NM-FN

            DISPLAY "Insert Middle and Last Name: "
            ACCEPT WS-CUST-NM-LN

            DISPLAY "Insert Email: "
            ACCEPT WS-CUST-EML

            DISPLAY "Insert Company: "
            ACCEPT WS-CUST-CMP

            DISPLAY "Insert Commercial Phone: "
            ACCEPT WS-CUST-TLF OF WS-CUST-TLF-CMR

            DISPLAY "Insert Phone: "
            ACCEPT WS-CUST-TLF OF WS-CUST-TLF-CLR

            DISPLAY "Insert FAX number: "
            ACCEPT WS-CUST-FAX

            DISPLAY "Insert " FUNCTION TRIM(WS-CUST-NM-FN) "'s Title: "
            ACCEPT WS-CUST-TTL

            DISPLAY "Insert Company's Site: "
            ACCEPT WS-CUST-STE

            DISPLAY "Insert Address 1: "
            ACCEPT WS-CUST-ADR-1

            DISPLAY "Insert Address 2: "
            ACCEPT WS-CUST-ADR-2

            DISPLAY "Insert City: "
            ACCEPT WS-CUST-CTY

            DISPLAY "Insert State <02>: "
            ACCEPT WS-CUST-STT

            DISPLAY "Insert Postal Code: "
            ACCEPT WS-CUST-PST

            DISPLAY "Insert Country or Region: "
            ACCEPT WS-CUST-CRT

            STRING FUNCTION TRIM(WS-CUST-NM-FN)       DELIMITED BY SIZE
                   ' '                 DELIMITED BY SIZE
                   FUNCTION TRIM(WS-CUST-NM-LN)       DELIMITED BY SIZE
                   ','                 DELIMITED BY SIZE
                   FUNCTION TRIM(WS-CUST-NM-FN)       DELIMITED BY SIZE
                   ','                 DELIMITED BY SIZE
                   FUNCTION TRIM(WS-CUST-NM-LN)       DELIMITED BY SIZE
                   ','                 DELIMITED BY SIZE
                   FUNCTION TRIM(WS-CUST-EML)         DELIMITED BY SIZE
                   ','                 DELIMITED BY SIZE
                   FUNCTION TRIM(WS-CUST-CMP)         DELIMITED BY SIZE
                   ','                 DELIMITED BY SIZE
                   '('                 DELIMITED BY SIZE
                   WS-CUST-TLF OF WS-CUST-TLF-CMR(1:2)
                                       DELIMITED BY SPACES
                   ') '                DELIMITED BY SIZE
                   WS-CUST-TLF OF WS-CUST-TLF-CMR(4:)
                                       DELIMITED BY SPACES
                   ','                 DELIMITED BY SIZE
                   '('                 DELIMITED BY SIZE
                   WS-CUST-TLF OF WS-CUST-TLF-CLR(1:2)
                                       DELIMITED BY SPACES
                   ') '                DELIMITED BY SIZE
                   WS-CUST-TLF OF WS-CUST-TLF-CLR(4:)
                                       DELIMITED BY SPACES
                   ','                 DELIMITED BY SIZE
                   '('                 DELIMITED BY SIZE
                   WS-CUST-FAX(1:2)    DELIMITED BY SPACES
                   ') '                DELIMITED BY SIZE
                   WS-CUST-FAX(4:)     DELIMITED BY SPACES
                   ','                 DELIMITED BY SIZE
                   FUNCTION TRIM(WS-CUST-TTL)         DELIMITED BY SIZE
                   ','                 DELIMITED BY SIZE
                   FUNCTION TRIM(WS-CUST-STE)         DELIMITED BY SIZE
                   ','                 DELIMITED BY SIZE
                   FUNCTION TRIM(WS-CUST-ADR-1)       DELIMITED BY SIZE
                   ','                 DELIMITED BY SIZE
                   FUNCTION TRIM(WS-CUST-ADR-2)       DELIMITED BY SIZE
                   ','                 DELIMITED BY SIZE
                   FUNCTION TRIM(WS-CUST-CTY)         DELIMITED BY SIZE
                   ','                 DELIMITED BY SIZE
                   FUNCTION TRIM(WS-CUST-STT)         DELIMITED BY SIZE
                   ','                 DELIMITED BY SIZE
                   FUNCTION TRIM(WS-CUST-PST)         DELIMITED BY SIZE
                   ','                 DELIMITED BY SIZE
                   FUNCTION TRIM(WS-CUST-CRT)         DELIMITED BY SIZE

                   INTO REG-CSV
            END-STRING

      *      MOVE WS-CUST-RECORD        TO REG-CSV

            WRITE REG-CSV

            DISPLAY '<F> to end'
            DISPLAY '<OTHER> to restart'
            ACCEPT WS-EOF

            END-PERFORM

            CLOSE CSV-OTPT

            STOP RUN.
       END PROGRAM CTTWRT.

# Microsoft 365 - Admin Center CSV Writer in COBOL

## Write CSV File for M365 Admin Center Contacts

Write with the .EXE and it will export into the same folder as an .CSV file
 
The file has the following fields:

      *     The record length is 297 bytes maximum
      *     COLUMN A: FULL NAME                    (41 | B + " " + C)
      *     COLUMN B: FIRST NAME                   (10)
      *     COLUMN C: LAST NAME                    (30)
      *     COLUMN D: EMAIL                        (30)
      *     COLUMN E: COMPANY                      (30)
      *     COLUMN F: TELEPHONE - COMMERCIAL       (10) - Formated as (xx) xxxx.xxxx
      *     COLUMN G: TELEPHONE - CELULAR          (11) - Formated as (xx)xxxxx.xxxx
      *     COLUMN H: FAX NUMBER                   (10) - Formated as (xx) xxxx.xxxx
      *     COLUMN I: TITLE - (IN COMPANY)         (20)
      *     COLUMN J: SITE                         (30)
      *     COLUMN K: ADDRESS                      (30)
      *     COLUMN L: ADDRESS 2                    (30)
      *     COLUMN M: CITY                         (20)
      *     COLUMN N: STATE                        (02)
      *     COLUMN O: POSTAL CODE                  (10) - Formated as xxxxx.xxx
      *     COLUMN P: COUNTRY                      (10)


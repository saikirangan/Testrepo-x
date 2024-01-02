       IDENTIFICATION DIVISION.
       PROGRAM-ID. DEMOPGM.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-X    PIC 9(02).
       PROCEDURE DIVISION.
           MOVE 01 TO WS-X.
           IF WS-X = 00 THEN
              MOVE ZERO TO RETURN-CODE
           ELSE
              MOVE +12 TO RETURN-CODE.
           GOBACK.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PGM02C.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       COPY CPY02C.
       PROCEDURE DIVISION.
           INITIALIZE WS-VARS.
           ACCEPT WS-X.
           ACCEPT WS-Y.
           ACCEPT WS-Z.
           CALL 'PGM02D' USING WS-VARS.
           IF WS-INVALID THEN
              MOVE +12  TO RETURN-CODE
           ELSE
              MOVE ZERO TO RETURN-CODE.
           GOBACK.
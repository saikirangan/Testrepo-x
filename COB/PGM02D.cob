       IDENTIFICATION DIVISION.
       PROGRAM-ID. PGM02D.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-TOT PIC 9(03).
       LINKAGE SECTION.
       COPY CPY02C.
       PROCEDURE DIVISION USING WS-VARS.
           COMPUTE WS-TOT = WS-X + WS-Y.
           DISPLAY 'SUM OF ' WS-X ' AND ' WS-Y ' IS: ' WS-TOT.
           IF WS-TOT NOT = WS-Z THEN
              SET WS-INVALID TO TRUE
           ELSE
              SET WS-VALID TO TRUE.
           GOBACK.
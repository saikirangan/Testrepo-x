       IDENTIFICATION DIVISION.                                         00010001
       PROGRAM-ID. PGM02.                                               00020001
       ENVIRONMENT DIVISION.                                            00030001
       DATA DIVISION.                                                   00040001
       WORKING-STORAGE SECTION.                                         00040002
       01 WS-X PIC 9(02).
       01 WS-Y PIC 9(02).
       01 WS-Z PIC 9(03).
       PROCEDURE DIVISION.                                              00060001
           ACCEPT WS-X.
           ACCEPT WS-Y.
           COMPUTE WS-Z = WS-X + WS-Y.                                  00060004
           DISPLAY 'SUM OF ' WS-X ' AND 'WS-Y ' IS:' WS-Z.              00070001
           GOBACK.                                                     00080001

       IDENTIFICATION DIVISION.                                         00010000
       PROGRAM-ID. PGM03A.                                              00020000
       DATA DIVISION.                                                   00030000
       WORKING-STORAGE SECTION.                                         00040000
       01 WS-NUMBER-A PIC 9(5).                                         00050000
       01 WS-NUMBER-B PIC 9(5).                                         00060000
       01 WS-RESULT-B PIC 9(6).                                         00070000
       01 WS-RESULT-C PIC 9(6).                                         00080000
       01 WS-RETURN-CODE PIC 99.                                        00090000
       PROCEDURE DIVISION.                                              00100000
       MAIN-ROUTINE.                                                    00110000
            DISPLAY 'Enter Number A:'                                   00120000
            ACCEPT WS-NUMBER-A.                                         00130000
            DISPLAY 'Enter Number B:'                                   00140000
            ACCEPT WS-NUMBER-B.                                         00150000
            DISPLAY 'Program A is calling Program B'.                   00160000
            CALL 'PGM03B2' USING WS-NUMBER-A, WS-NUMBER-B,              00170004
                                          WS-RESULT-B, WS-RESULT-C.     00171006
            DISPLAY 'Result received from Program B: ' WS-RESULT-B.     00180005
            DISPLAY 'Result received from Program C: ' WS-RESULT-C.     00190005
                                                                        00200001
            DISPLAY 'Final Results:'                                    00220000
            DISPLAY 'Result from Program B: ' WS-RESULT-B.              00230000
            DISPLAY 'Result from Program C: ' WS-RESULT-C.              00240000
            IF WS-RESULT-B = WS-RESULT-C                                00250000
               MOVE 0 TO WS-RETURN-CODE                                 00260000
            ELSE                                                        00270000
               MOVE 12 TO WS-RETURN-CODE                                00280000
            END-IF                                                      00290000
            DISPLAY 'Return Code: ' WS-RETURN-CODE                      00300000
            GOBACK.                                                     00310007
       IDENTIFICATION DIVISION.                                         00010000
       PROGRAM-ID.    PGM03BT.                                          00020001
       ENVIRONMENT DIVISION.                                            00030000
       INPUT-OUTPUT SECTION.                                            00040000
       FILE-CONTROL.                                                    00050000
           SELECT FILE1 ASSIGN TO DATAFILE.                             00060005
       DATA DIVISION.                                                   00070000
       FILE SECTION.                                                    00080000
       FD FILE1                                                         00090000
           RECORDING MODE IS F.                                         00100000
       01 FL-REC.                                                       00110000
           05 FL-NUMBER-A PIC 9(5).                                     00120000
           05 FILLER PIC X(1).                                          00130000
           05 FL-NUMBER-B PIC 9(5).                                     00140000
           05 FILLER PIC X(69).                                         00150000
       WORKING-STORAGE SECTION.                                         00160000
       01 WS-REC.                                                       00170000
           05 WS-NUMBER-A PIC 9(5).                                     00180000
           05 WS-NUMBER-B PIC 9(5).                                     00190000
           05 WS-RESULT-B PIC 9(6).                                     00200000
           05 WS-RESULT-C PIC 9(6).                                     00210000
           05 WS-RETURN-CODE PIC 99.                                    00220000
       01 WS-EOF      PIC X(1) VALUE 'N'.                               00230000
       PROCEDURE DIVISION.                                              00240000
       MAIN-PARA.                                                       00250000
            OPEN INPUT FILE1.                                           00260000
                 PERFORM READ-PARA UNTIL WS-EOF = 'Y'                   00270000
                 CLOSE FILE1.                                           00280005
                 STOP RUN.                                              00290000
       READ-PARA.                                                       00300000
            READ FILE1 INTO WS-REC                                      00310004
                AT END MOVE 'Y' TO WS-EOF                               00320000
                NOT AT END PERFORM PROCESS-PARA                         00330000
            END-READ.                                                   00340000
       PROCESS-PARA.                                                    00350000
            MOVE FL-NUMBER-A TO WS-NUMBER-A.                            00360000
            MOVE FL-NUMBER-B TO WS-NUMBER-B.                            00370000
            DISPLAY WS-NUMBER-A.                                        00380000
            DISPLAY WS-NUMBER-B.                                        00390000
            CALL 'PGM03B2' USING WS-NUMBER-A, WS-NUMBER-B,              00400012
                                          WS-RESULT-B, WS-RESULT-C.     00410012
            IF WS-RESULT-B = WS-RESULT-C                                00420012
            MOVE 0 TO RETURN-CODE                                       00430012
            ELSE                                                        00440012
            MOVE 12 TO RETURN-CODE                                      00450012
            END-IF.                                                     00460014
       END-PARA.                                                        00470000
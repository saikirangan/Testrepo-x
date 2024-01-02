       IDENTIFICATION DIVISION.                                         00010000
       PROGRAM-ID.    PGM03B.                                           00020000
       ENVIRONMENT DIVISION.                                            00030000
       INPUT-OUTPUT SECTION.                                            00040000
       FILE-CONTROL.                                                    00050000
           SELECT FILE1 ASSIGN TO DATAFILE                              00060004
           ORGANIZATION IS SEQUENTIAL.                                  00070014
       DATA DIVISION.                                                   00080000
       FILE SECTION.                                                    00090008
       FD FILE1                                                         00100017
           RECORDING MODE IS F.                                         00100117
       01 FL-REC.                                                       00101004
           05 FL-NUMBER-A PIC 9(5).                                     00110010
           05 FILLER PIC X(1).                                          00111010
           05 FL-NUMBER-B PIC 9(5).                                     00120010
           05 FILLER PIC X(69).                                         00141010
       WORKING-STORAGE SECTION.                                         00150000
       01 WS-REC.                                                       00151021
           05 WS-NUMBER-A PIC 9(5).                                     00160021
           05 WS-NUMBER-B PIC 9(5).                                     00170021
       01 WS-EOF      PIC X(1) VALUE 'N'.                               00200063
       PROCEDURE DIVISION.                                              00210009
       MAIN-PARA.                                                       00211063
            OPEN INPUT FILE1.                                           00220064
                 PERFORM READ-PARA UNTIL WS-EOF = 'Y'                   00230064
                 CLOSE FILE1                                            00290071
                 STOP RUN.                                              00300064
       READ-PARA.                                                       00301067
            READ FILE1                                                  00302068
                AT END MOVE 'Y' TO WS-EOF                               00303070
                NOT AT END PERFORM PROCESS-PARA                         00303170
            END-READ.                                                   00303270
       PROCESS-PARA.                                                    00303470
            MOVE FL-NUMBER-A TO WS-NUMBER-A.                            00303570
            MOVE FL-NUMBER-B TO WS-NUMBER-B.                            00303670
            DISPLAY WS-NUMBER-A.                                        00303770
            DISPLAY WS-NUMBER-B.                                        00303870
            GOBACK.                                                     00460070
       END-PARA.                                                        00470009
       IDENTIFICATION DIVISION.                                         00010000
       PROGRAM-ID. PGM03B2.                                             00020003
       DATA DIVISION.                                                   00030000
       LINKAGE SECTION.                                                 00040000
       01 LS-NUMBER-A PIC 9(5).                                         00050000
       01 LS-NUMBER-B PIC 9(5).                                         00060000
       01 LS-RESULT-B PIC 9(6).                                         00070000
       01 LS-RESULT-C PIC 9(6).                                         00071003
       PROCEDURE DIVISION USING LS-NUMBER-A, LS-NUMBER-B, LS-RESULT-B,  00080004
                              LS-RESULT-C.                              00081008
       MAIN-ROUTINE.                                                    00090000
            DISPLAY 'Program B is performing arithmetic operations'.    00100000
            COMPUTE LS-RESULT-B = LS-NUMBER-A / LS-NUMBER-B.            00110012
            DISPLAY 'Program B completed arithmetic operations'.        00120000
            DISPLAY 'Result from Program B: ' LS-RESULT-B.              00130000
            DISPLAY 'Program B is calling Program C'                    00141001
            CALL 'PGM03C1' USING LS-NUMBER-A, LS-NUMBER-B,              00142002
                                                         LS-RESULT-C.   00150001
            DISPLAY 'Result received from Program C: ' LS-RESULT-C.     00160001
            GOBACK.                                                     00180001
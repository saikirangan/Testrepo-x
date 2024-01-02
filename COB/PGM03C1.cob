       IDENTIFICATION DIVISION.                                         00010000
       PROGRAM-ID. PGM03C1.                                             00020000
       DATA DIVISION.                                                   00030000
       LINKAGE SECTION.                                                 00040000
       01 LC-NUMBER-A PIC 9(5).                                         00050000
       01 LC-NUMBER-B PIC 9(5).                                         00060000
       01 LC-RESULT-C PIC 9(6).                                         00070000
       PROCEDURE DIVISION USING LC-NUMBER-A, LC-NUMBER-B, LC-RESULT-C.  00080000
       MAIN-ROUTINE.                                                    00090000
            DISPLAY 'Program C is performing arithmetic operations'.    00100000
            DISPLAY LC-NUMBER-A.                                        00101007
            DISPLAY LC-NUMBER-B.                                        00102007
            COMPUTE LC-RESULT-C = LC-NUMBER-A - LC-NUMBER-B             00103010
            DISPLAY 'Program C completed arithmetic operations'.        00120000
            DISPLAY 'Result from Program C: ' LC-RESULT-C.              00130000
            GOBACK.                                                     00150001
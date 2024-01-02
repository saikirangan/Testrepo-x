       IDENTIFICATION DIVISION.
       PROGRAM-ID. STUD.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
                SELECT EMPFIL ASSIGN TO EMPFILE
                ORGANIZATION IS SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD EMPFIL
            RECORDING MODE IS F.
       01 FL-REC.
          05 STUD-ID    PIC X(09).
          05 FILLER    PIC X(71).
       WORKING-STORAGE SECTION.
       01 WS-FL-REC.
          05 FL-STUD-ID PIC X(09).
          05 FILLER    PIC X(71).

       77 WS-STUD-ID1 PIC 9(09).

       01 WS-EOF    PIC A VALUE SPACE.

            EXEC SQL
               INCLUDE SQLCA
            END-EXEC.

            EXEC SQL
               INCLUDE STUDENT
            END-EXEC.

       01  DCLSTUDENT.
           10 WS-STUD-ID               PIC S9(9) USAGE COMP.
           10 WS-STUD-NAME             PIC X(30).
           10 WS-STUD-DEPT             PIC X(10).

       PROCEDURE DIVISION.

            OPEN INPUT EMPFIL.

            PERFORM UNTIL WS-EOF = 'Y'

               READ EMPFIL INTO WS-FL-REC
                 AT END MOVE 'Y' TO WS-EOF
                 NOT AT END PERFORM A000-WRITE-PARA
                 COMPUTE WS-STUD-ID = FUNCTION NUMVAL(FL-STUD-ID)
                 MOVE  WS-STUD-ID TO WS-STUD-ID1
                 PERFORM A000-STUDENT-ID-VAL
               END-READ

            END-PERFORM.

            CLOSE EMPFIL.

            GOBACK.

       A000-WRITE-PARA.

             COMPUTE WS-STUD-ID = FUNCTION NUMVAL(FL-STUD-ID)

             EXEC SQL
                  SELECT  STUD_ID, STUD_NAME, STUD_DEPT
                    INTO  :WS-STUD-ID, :WS-STUD-NAME, :WS-STUD-DEPT
                 FROM STUD_STUDENT
                 WHERE STUD_ID = :WS-STUD-ID
             END-EXEC.


             EVALUATE SQLCODE
             WHEN 100
                  DISPLAY 'NO SUCH RECORD FOUND'
                  MOVE +12  TO RETURN-CODE
             WHEN 0
                  DISPLAY 'STUD-ID: ' WS-STUD-ID
                  DISPLAY 'STUD-NAME: ' WS-STUD-NAME
      *           PERFORM A000-DEPARTMENT-VAL
      *           MOVE WS-STUD-ID TO WS-STUD-ID1
      *           PERFORM A000-STUDENT-ID-VAL
                  MOVE 0    TO RETURN-CODE
             END-EVALUATE.

      *A000-DEPARTMENT-VAL.
      *      EVALUATE WS-STUD-DEPT
      *      WHEN 'CSE'
      *           DISPLAY 'COMPUTER SCIENCE'
      *      WHEN 'MEC'
      *           DISPLAY 'MECHANICAL'
      *      WHEN 'ECE'
      *           DISPLAY 'ELECTRONIC AND COMMUNICATION ENG'
      *      WHEN 'IT'
      *           DISPLAY 'INFORMATION TECH'
      *      WHEN OTHER
      *           DISPLAY 'NOT VALID'
      *      END-EVALUATE.

       A000-STUDENT-ID-VAL.
             IF WS-STUD-ID1 IS NUMERIC
                  DISPLAY 'VALID STUDENT ID'
             ELSE
                  DISPLAY 'NOT VALID'
             END-IF.
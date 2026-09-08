       IDENTIFICATION DIVISION.
       PROGRAM-ID. Simple-Cobol-Bank-Application.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 YOUR-NAME PIC x(30).
       01 YOUR-AGE PIC 9(3).
       01 YOUR-CITY PIC x(30).
       01 YOUR-COUNTRY PIC x(30).

       PROCEDURE DIVISION.
       
           DISPLAY "What is your name? ".
           ACCEPT YOUR-NAME.
           DISPLAY "What is your age? ".
           ACCEPT YOUR-AGE.
           DISPLAY "What is your city? ".
           ACCEPT YOUR-CITY.
           DISPLAY "What is your country? ".
           ACCEPT YOUR-COUNTRY.

           DISPLAY "Hello, " YOUR-NAME.
           DISPLAY "You live in " FUNCTION TRIM(YOUR-CITY) ", " 
                   YOUR-COUNTRY.

           STOP RUN.

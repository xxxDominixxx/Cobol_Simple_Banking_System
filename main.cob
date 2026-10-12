       IDENTIFICATION DIVISION.
       PROGRAM-ID. Simple-Cobol-Bank-Application.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CUSTOMER-FILE
               ASSIGN TO "customer.dat"
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS CUSTOMER-FILE-STATUS.

       DATA DIVISION.

       FILE SECTION.
       FD CUSTOMER-FILE.
       01 CUSTOMER-FILE-RECORD.
           03 FILE-CUSTOMER-NAME PIC X(30).
           03 FILE-CUSTOMER-AGE PIC 9(3).
           03 FILE-CUSTOMER-CITY PIC X(30).
           03 FILE-CUSTOMER-COUNTRY PIC X(30).

       WORKING-STORAGE SECTION.

       01 CUSTOMER-TABLE.
           02 CUSTOMER OCCURS 10 TIMES.
               03 CUSTOMER-NAME PIC X(30).
               03 CUSTOMER-AGE PIC 9(3).
               03 CUSTOMER-CITY PIC X(30).
               03 CUSTOMER-COUNTRY PIC X(30).

       01 CUSTOMER-FILE-STATUS PIC XX.
       01 CUSTOMER-NUM PIC 99.
       01 CUSTOMER-COUNT PIC 99.
       01 CUSTOMER-REMAINING PIC 99.
       01 USERS-TO-ADD PIC 99.
       01 MENU-CHOICE PIC 9.
       01 FILE-RECORD-COUNT PIC 99.
       01 FILE-READ-STATUS PIC XX.

       PROCEDURE DIVISION.

           MOVE 0 TO CUSTOMER-COUNT
           MOVE 0 TO MENU-CHOICE

           PERFORM LOAD-CUSTOMERS

           PERFORM UNTIL MENU-CHOICE = 3

               DISPLAY " "
               DISPLAY "===== SIMPLE COBOL BANK ====="
               DISPLAY "1. Add users"
               DISPLAY "2. Display all users"
               DISPLAY "3. Exit"
               DISPLAY "Choose an option: "
               ACCEPT MENU-CHOICE

               EVALUATE MENU-CHOICE

      *> ======== Choice 1 --- Add users ==========================

                   WHEN 1
                       COMPUTE CUSTOMER-REMAINING =
                           10 - CUSTOMER-COUNT

                       IF CUSTOMER-REMAINING = 0
                           DISPLAY " "
                           DISPLAY
                               "The customer table is full."
                           DISPLAY
                               "No more customers can be added."
                       ELSE
                           CALL "SYSTEM" USING "cls"

                           DISPLAY "There are "
                                   CUSTOMER-REMAINING
                                   " customer spaces remaining."

                           DISPLAY
                               "How many users do you want to add? "
                           ACCEPT USERS-TO-ADD

                           IF USERS-TO-ADD < 1
                              OR USERS-TO-ADD >
                                  CUSTOMER-REMAINING

                               DISPLAY " "
                               DISPLAY
                                   "Invalid number of customers."
                               DISPLAY
                                   "You can add between 1 and "
                                   CUSTOMER-REMAINING
                                   " customers."

                           ELSE
                               PERFORM USERS-TO-ADD TIMES

                                   ADD 1 TO CUSTOMER-COUNT
                                   MOVE CUSTOMER-COUNT
                                       TO CUSTOMER-NUM

                                   DISPLAY " "
                                   DISPLAY "Adding customer "
                                           CUSTOMER-NUM

                                   DISPLAY "What is your name? "
                                   ACCEPT
                                       CUSTOMER-NAME(
                                           CUSTOMER-NUM)

                                   DISPLAY "What is your age? "
                                   ACCEPT
                                       CUSTOMER-AGE(
                                           CUSTOMER-NUM)

                                   DISPLAY "What is your city? "
                                   ACCEPT
                                       CUSTOMER-CITY(
                                           CUSTOMER-NUM)

                                   DISPLAY
                                       "What is your country? "
                                   ACCEPT
                                       CUSTOMER-COUNTRY(
                                           CUSTOMER-NUM)

                                   CALL "SYSTEM" USING "cls"

                               END-PERFORM

                               IF USERS-TO-ADD = 1
                                   DISPLAY
                                       "Customer successfully added."
                               ELSE
                                   DISPLAY
                                       "Successfully added "
                                       USERS-TO-ADD
                                       " customers."
                               END-IF

                           END-IF
                       END-IF

      *> ======== Choice 2 --- Display all users ==================

                   WHEN 2
                       IF CUSTOMER-COUNT = 0
                           CALL "SYSTEM" USING "cls"
                           DISPLAY
                               "No customers have been added yet."
                       ELSE
                           PERFORM VARYING CUSTOMER-NUM
                               FROM 1 BY 1
                               UNTIL CUSTOMER-NUM >
                                   CUSTOMER-COUNT

                               DISPLAY " "
                               DISPLAY "Customer "
                                       CUSTOMER-NUM ":"

                               DISPLAY "Name: "
                                       FUNCTION TRIM(
                                           CUSTOMER-NAME(
                                               CUSTOMER-NUM))

                               DISPLAY "Age: "
                                       CUSTOMER-AGE(
                                           CUSTOMER-NUM)

                               DISPLAY "City: "
                                       FUNCTION TRIM(
                                           CUSTOMER-CITY(
                                               CUSTOMER-NUM))

                               DISPLAY "Country: "
                                       FUNCTION TRIM(
                                           CUSTOMER-COUNTRY(
                                               CUSTOMER-NUM))

                           END-PERFORM
                       END-IF

      *> ======== Choice 3 --- Exit program ======================

                   WHEN 3
                       PERFORM SAVE-CUSTOMERS
                       DISPLAY "Exiting program..."

                   WHEN OTHER
                       DISPLAY "Invalid choice."

               END-EVALUATE

           END-PERFORM

           STOP RUN.

      *> ======== Load saved customers ===========================

       LOAD-CUSTOMERS.
           MOVE 0 TO FILE-RECORD-COUNT
           MOVE 0 TO CUSTOMER-COUNT

           OPEN INPUT CUSTOMER-FILE

           IF CUSTOMER-FILE-STATUS = "00"

               PERFORM UNTIL CUSTOMER-FILE-STATUS = "10"

                   READ CUSTOMER-FILE
                       AT END
                           CONTINUE
                       NOT AT END
                           IF FILE-RECORD-COUNT < 10
                               ADD 1 TO FILE-RECORD-COUNT

                               MOVE FILE-CUSTOMER-NAME
                                   TO CUSTOMER-NAME(
                                       FILE-RECORD-COUNT)

                               MOVE FILE-CUSTOMER-AGE
                                   TO CUSTOMER-AGE(
                                       FILE-RECORD-COUNT)

                               MOVE FILE-CUSTOMER-CITY
                                   TO CUSTOMER-CITY(
                                       FILE-RECORD-COUNT)

                               MOVE FILE-CUSTOMER-COUNTRY
                                   TO CUSTOMER-COUNTRY(
                                       FILE-RECORD-COUNT)

                               ADD 1 TO CUSTOMER-COUNT
                           END-IF
                   END-READ

               END-PERFORM

               CLOSE CUSTOMER-FILE

               DISPLAY "Loaded "
                       CUSTOMER-COUNT
                       " customers from file."

           ELSE
               DISPLAY
                   "No saved customer file found yet."
           END-IF.

      *> ======== Save customers ================================

       SAVE-CUSTOMERS.
           OPEN OUTPUT CUSTOMER-FILE

           IF CUSTOMER-FILE-STATUS = "00"

               PERFORM VARYING CUSTOMER-NUM
                   FROM 1 BY 1
                   UNTIL CUSTOMER-NUM > CUSTOMER-COUNT

                   MOVE CUSTOMER-NAME(CUSTOMER-NUM)
                       TO FILE-CUSTOMER-NAME

                   MOVE CUSTOMER-AGE(CUSTOMER-NUM)
                       TO FILE-CUSTOMER-AGE

                   MOVE CUSTOMER-CITY(CUSTOMER-NUM)
                       TO FILE-CUSTOMER-CITY

                   MOVE CUSTOMER-COUNTRY(CUSTOMER-NUM)
                       TO FILE-CUSTOMER-COUNTRY

                   WRITE CUSTOMER-FILE-RECORD

                   IF CUSTOMER-FILE-STATUS NOT = "00"
                       DISPLAY
                           "Error writing customer record."
                   END-IF

               END-PERFORM

               CLOSE CUSTOMER-FILE

               IF CUSTOMER-FILE-STATUS = "00"
                   DISPLAY
                       "Customers saved successfully."
               END-IF

           ELSE
               DISPLAY
                   "Error: Could not open customer file for saving."
           END-IF.

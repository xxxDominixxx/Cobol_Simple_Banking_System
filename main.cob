       IDENTIFICATION DIVISION.
       PROGRAM-ID. Simple-Cobol-Bank-Application.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 CUSTOMER-TABLE.
           02 CUSTOMER OCCURS 10 TIMES.    *> Creates space for 10 customers
               03 CUSTOMER-NAME PIC X(30).
               03 CUSTOMER-AGE PIC 9(3).
               03 CUSTOMER-CITY PIC X(30).
               03 CUSTOMER-COUNTRY PIC X(30).

       01 CUSTOMER-NUM PIC 99.
       01 CUSTOMER-COUNT PIC 99.
       01 CUSTOMER-REMAINING PIC 99.
       01 USERS-TO-ADD PIC 99.
       01 MENU-CHOICE PIC 9.

       PROCEDURE DIVISION.

           MOVE 0 TO CUSTOMER-COUNT.   *> start with 0 customers

           PERFORM UNTIL MENU-CHOICE = 3   *> repeat until user chooses option 3

               DISPLAY " "
               DISPLAY "===== SIMPLE COBOL BANK ====="
               DISPLAY "1. Add users"
               DISPLAY "2. Display all users"
               DISPLAY "3. Exit"
               DISPLAY "Choose an option: "
               ACCEPT MENU-CHOICE

               EVALUATE MENU-CHOICE    *> check which menu option was selected

           *> ======== Choice 1 --- Add users ==========================

                   WHEN 1
                       COMPUTE CUSTOMER-REMAINING = 10 - CUSTOMER-COUNT

                       IF CUSTOMER-REMAINING = 0
                           DISPLAY " "
                           DISPLAY "The customer table is full."
                           DISPLAY "No more customers can be added."
                       ELSE                       
                           CALL "SYSTEM" USING "cls" *> Clean terminal
                           DISPLAY "There are " 
                                   CUSTOMER-REMAINING
                                   " customer spaces remaining."                         
                           DISPLAY "How many users do you want to add? "
                           ACCEPT USERS-TO-ADD
    
                           IF USERS-TO-ADD < 1 
                              OR USERS-TO-ADD > CUSTOMER-REMAINING
                               DISPLAY " "
                               DISPLAY "Invalid number of customers."
                               DISPLAY "You can add between 1 and "
                                       CUSTOMER-REMAINING
                                       " customers."
    
                           ELSE
                               PERFORM USERS-TO-ADD TIMES  *> perform it so many times
    
                                   ADD 1 TO CUSTOMER-COUNT  *> increase customer count by 1
                                   MOVE CUSTOMER-COUNT TO CUSTOMER-NUM   *> copy current customer count to customer number
    
                                   DISPLAY " "
                                   DISPLAY "Adding customer "
                                           CUSTOMER-NUM
    
                                   DISPLAY "What is your name? "
                                   ACCEPT CUSTOMER-NAME(CUSTOMER-NUM)
    
                                   DISPLAY "What is your age? "
                                   ACCEPT CUSTOMER-AGE(CUSTOMER-NUM)
    
                                   DISPLAY "What is your city? "
                                   ACCEPT CUSTOMER-CITY(CUSTOMER-NUM)
    
                                   DISPLAY "What is your country? "
                                   ACCEPT CUSTOMER-COUNTRY(CUSTOMER-NUM)
                                   
                                   CALL "SYSTEM" USING "cls"
                               END-PERFORM
                               
                               IF USERS-TO-ADD < 2
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

           *> ================ Choice 2 --- Display all Users ==========

                   WHEN 2
                       IF CUSTOMER-COUNT = 0
                           CALL "SYSTEM" USING "cls"
                           DISPLAY "No customers have been added yet."
                       ELSE
                           PERFORM VARYING CUSTOMER-NUM    *> loop through every customer
                               FROM 1 BY 1                 *> starting from 1 and increasing by 1
                               UNTIL CUSTOMER-NUM > CUSTOMER-COUNT *> stop after reaching customer count

                               DISPLAY " "
                               DISPLAY "Customer "
                                       CUSTOMER-NUM ":"
                               DISPLAY "Name: "
                                       FUNCTION TRIM(
                                       CUSTOMER-NAME(CUSTOMER-NUM))
                               DISPLAY "Age: "
                                       CUSTOMER-AGE(CUSTOMER-NUM)
                               DISPLAY "City: "
                                       FUNCTION TRIM(
                                       CUSTOMER-CITY(CUSTOMER-NUM))
                               DISPLAY "Country: "
                                       FUNCTION TRIM(
                                       CUSTOMER-COUNTRY(CUSTOMER-NUM))

                           END-PERFORM
                       END-IF

           *> =============== Choice 3 --- Exit program ================

                   WHEN 3
                       DISPLAY "Exiting program..."

                   WHEN OTHER
                       DISPLAY "Invalid choice."

               END-EVALUATE

           END-PERFORM.

           STOP RUN.

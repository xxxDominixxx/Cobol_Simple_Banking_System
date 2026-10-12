## 2026-09-05

### Starting point

I decided to start learning **COBOL** and build a small banking system as a practical project. The idea came from a Danish IT professional who recommended COBOL because it is an old language that is still used in many important legacy systems.

My goal is to eventually build a simple banking system where users can manage customers and accounts, deposit and withdraw money, transfer money, and view transaction history.

### Goal for today

Today I mainly wanted to get COBOL working on my computer and make sure I could successfully run a very simple COBOL program before starting the actual project.

### First Entry — 2026-09-05

I set up **MSYS2**, installed **GnuCOBOL 3.2**, and added COBOL support to VS Code using the BitLang COBOL extension.

Since I was working on this late at night, was extremely tired, and my only goal was simply to verify that the setup worked, I decided to use AI to create a very simple test program.

I then learned how the basic COBOL workflow works: writing a `.cob` source file, compiling it with GnuCOBOL, and running the resulting `.exe` program.

I ran into a few setup issues along the way, including GnuCOBOL configuration and using MSYS2 instead of the normal Windows terminal, but I managed to solve them and successfully ran my first COBOL program.

Overall, I now have a working COBOL development environment and a working test program. I am ready to start building the actual banking system.

### Future Goals

Start building the basic structure of the banking system and learn COBOL concepts along the way.

# ========================================================================================

## 2026-09-08

### First entry - learning the basics

Today I started learning the basic structure and syntax of COBOL. I learned about the different divisions, variables, `PIC`, `DISPLAY`, `ACCEPT`, and `STOP RUN`.

I also learned how COBOL level numbers work and how fixed-length `PIC X` fields can contain extra spaces. I learned to use `FUNCTION TRIM` when displaying these values.

I updated the program so it now asks for the user's name, age, city, and country, then displays the information back.

### Future Goals

Continue learning COBOL fundamentals, starting with numeric data and arithmetic, and gradually turn the program into the planned banking system.

# =======================================================================================

## 2026-09-18

### Second entry - working with multiple customers

Today I continued developing the basic structure of the banking system. I changed the program from storing information about a single customer to storing information about multiple customers.

I learned how to use **group items** and the `OCCURS` clause to create a table of customer records. Each customer contains a name, age, city, and country, and the program can currently store up to 10 customers.

I also learned how to use **subscripts** to access a specific customer, for example `CUSTOMER-NAME(1)` for the first customer. I introduced `CUSTOMER-COUNT` to keep track of how many customers have actually been added, rather than assuming that all 10 customer slots are being used.

I then turned the program into a simple **menu-driven application** with three choices: add users, display all users, or exit the program.

To make this work, I learned how to use `PERFORM`, including `PERFORM ... TIMES` for repeating an operation a specific number of times and `PERFORM VARYING` for looping through the customers. I also learned about `EVALUATE`, which can be used to handle different menu choices, similar to a switch/case structure in other programming languages.

The program can now add multiple customers and display all customers that have been added.

### Future Goals

Improve the input validation so the program cannot add more customers than the available storage, then perhaps start adding actual banking functionality such as customer accounts, account balances, deposits, withdrawals, and eventually transfers and transaction history.

# =======================================================================================

## 2026-10-08

### Third entry - customer capacity and input validation

I continued working on the banking system after some time away from actively developing it. I have not abandoned this project, or the other projects I am working on. There are simply other things that are more important and require my attention.

Between university, studying and assignments, job hunting, helping at home, taking care of some family members, and keeping up with my responsibilities, hobbies, relationships, church, volunteering, and other parts of my life, working on this project was not and will not be my highest priority. I still wanted to continue with it, though, because I am genuinely interested in learning COBOL and seeing how far I can take this project.

The main goal for this session was to improve the customer system so that the program could properly handle the limit of 10 customers. Previously, the program could attempt to add more customers than the `OCCURS 10 TIMES` table could store.

I added a `CUSTOMER-REMAINING` variable and used `COMPUTE` to calculate how many customer spaces were still available based on the current `CUSTOMER-COUNT`. The program now tells the user how many spaces remain before asking how many customers they want to add.

I also added input validation using `IF` statements. The user must now enter a number between 1 and the number of available spaces. If the customer table is already full, the program displays a message and prevents any additional customers from being added.

While implementing this, I learned more about **nested `IF` statements** and how multiple conditions can be combined using `OR`. I also got more practice understanding where `END-IF` is needed when working with nested conditions.

I then experimented with improving the terminal output by using `CALL "SYSTEM" USING "cls"` to clear the Windows terminal. This allows the program to clear the previous customer's information before moving on to the next customer when multiple customers are being added.

I also changed the success message so that the program gives different feedback depending on whether one customer or multiple customers were added.

The customer management part of the program is now more robust and user-friendly. The program can store up to 10 customers, prevents the user from exceeding that limit, and provides clearer feedback during the process.

I am not sure how frequently I will be able to update this project, but there will be updates. There will inevitably be periods where university, work, family, or other responsibilities take priority. However, I do not consider the project abandoned. I am interested in COBOL and want to continue developing this system whenever I have the time and opportunity to do so.

### Future Goals

Start adding actual banking functionality to the system. The next step will likely be creating accounts for customers, including account numbers and balances, and then adding functionality for deposits and withdrawals. Eventually, I want to expand this into transfers and transaction history.

# =======================================================================================

## 2026-10-12

### Fourth entry - file persistence

Today, I added basic file persistence to the banking system. Previously, customer information was only stored in memory and was lost when the program closed.

I implemented file handling using COBOL's file operations to save customer records to `customer.dat` and load them again when the program starts. I tested the functionality and confirmed that customer information persists between program runs.

This was an important step toward making the application more practical. Next, I will continue improving the project and gradually work toward adding actual banking functionality.

# =======================================================================================**
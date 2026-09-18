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

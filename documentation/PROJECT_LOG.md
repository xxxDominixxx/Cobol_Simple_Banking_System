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
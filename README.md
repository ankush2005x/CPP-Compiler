# C++ Compiler

Name : Ankush Naskar <br>
Entry No : 2022CSB1068

**To Run:**
1) &nbsp; lex cucu.l <br>
2) &nbsp; yacc -d cucu.y -o cucu.tab.c <br>
3) &nbsp; cc lex.yy.c cucu.tab.c -o output.out -ll <br>
4) &nbsp; ./output.out sample2.cu <br>

**Correct Code:** <br>
&emsp; Sample 1 : Mix of Different Syntax <br>
&emsp; Sample 2 : Code For Tower Of Hanoi

**Wrong Code:** <br>
&emsp; Sample 3 : Errors in Code for Tower of Hanoi

---> If error in syntax is deducted,
    program throws either Segmentation Fault in Terminal Or Prints Syntax Error in Lexer.cu <br>
---> If invalid character is detected, 
    program prints Invalid Character in Lexer.cu

Most C programs that satisfy below criteria should work!

**Supported:**
    Data Types - int, char*, char** ;
    Arrays [], 
    Strings,
    If else if, 
    Functions,
    While Loops,
    etc.

**Unsupported:**
    For Loops, 
    Operators : ++, --, +=, -=, *=, /= ;
    Structs,
    Multidimensional Arrays

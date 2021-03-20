// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.


// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[3], respectively.)

// Put your code here.

//Set R2 to 0
@2
M=0

//Check to see if the first or second value is equal to 0
@0
D=M
@END
D;JEQ

@1
D=M
@END
D;JEQ

//This loop multiplies the numbers at R0 and R1 by adding R0 to R2 n times, where n == R1
(LOOP)
	//Get R0
	@0
	D=M
	//Add R0 to R2
	@2
	M = M + D
	//Subtract 1 from R1
	@1
	M = M - 1
	D = M
	//JUMP TO END if R1 == 0
	@LOOP
	D;JGT

//Infinite termination function
(END)
@END
0;JMP


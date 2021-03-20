// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

//This label (function) will reset the Screen's memory location and store
//the value in R0
(RESET)
    @SCREEN
    D = A
    @0
    M = D

//This function drives the program. The infinite main loop checks for keyboard
//input and colors the screen black or white based on the value at KBD
(MAIN)
    @KBD
    D=M
    @BLACKEN
    D ; JGT 
    @WHITEN
    D ; JEQ 
    @MAIN
    0;JMP

//This function sets the R1 value to black and calls the fill function
(BLACKEN)
    @1
    M = -1
    @FILL
    0;JMP

//This function sets the R1 value to white and calls the fill function
(WHITEN)
    @1
    M = 0
    @FILL
    0;JMP

//This function fills the screen with a prespecified color
(FILL)

    //Get the screen color from R1
    @1	
    D=M	
    //Get address of pixel and set it to the proper color
    @0
    A=M	
    M=D
    //Store screen pixel + 1 in memory
    @0
    D=M+1
    //Subtract the pixel address from the screen address to see which 
    //pixel we are on and see if it is the last one 
    @KBD
    D=A-D
    //Actually increment pixel in memory
    @0
    M=M+1
    A=M
    ///Loop if pixel != 0
    @FILL
    D;JGT

@RESET
0;JMP

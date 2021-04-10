@R0
M = -1//SET R0 TO -1

@5
D = A //Get value of 5
@COUNTER
M = D //Set our counter's value to 5

@CURRENT_REGISTER
A = 1 //1 is the starting register for our array

//ARRAY DECLARATION
//index 0 (R1) = 1 
@1 
M = A
//index 1 (R2) = 3
@3
D = A
@R2 
M = D
//index 2 (R3) = 9
@9
D = A
@R3 
M = D
//index 3 (R4) = 7
@7
D = A
@R4 
M = D
//index 4 (R5) = 5
@R5 
M = A

//MAIN FUNCTION
(MAIN)

//Remaining iterations check
@COUNTER
M = M - 1 //Subtract 1 from our remaining count
D = M //Store our remaining iterations
@END
D;JLT //If less than 0, we have no remaining iterations

//Use register pointer to get the value from the neccessary register
@CURRENT_REGISTER
A = M //Set our register address to the address stored in the CURRENT REGISTER pointer
D = M //Store the value at that address in the array

//Compare and potentially swap the larger value in to R0
@R0
D = D - M //Get the value from R0 (our largest value) and subtract the value from the previous step from it
@SWAP_GREATEST
D;JGE //If the resulting value is greater than 0, we know the new value is larger and need to swap them out

//Continue
@MAIN
0;JMP

//SWAP FUNCTION
(SWAP_GREATEST)

//Get value from current memory address
@CURRENT_REGISTER
M = M + 1 //Increment the current register pointer to the next register
A = M - 1 //Set our address to the current register pointer (-1 due to previous step)
D = M //Get the value stored in memory at that address

//Store that value
@R0
M = D //Set the value at R0 to our new value

@MAIN
0;JMP//Continue program 

//TERMIATION FUNCTION
(END)
@END
0;JMP


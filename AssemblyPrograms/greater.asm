
//Set R1 to 7
@7
D = A
@R1
M = D 
//Set R2 to 11
@11
D = A
@R2
M = D
//Set R3 to 5
@5
D = A
@R3
M = D

//==================================================================
//			MAIN LOGIC LOOP
//==================================================================
//Check if R1 >= R2
@R1
D = M //Get value of R1
@R2
D = D - M //Subtract R2 from R1
@BRANCH_ONE
D ; JGE //Go to branch one if R1 is >= R2

//Check if R2 >= R3
@R2
D = M //Get value of R2
@R3
D = D - M //Subtract R3 from R2
@BRANCH_TWO
D ; JGE //Go to branch two if R2 >= R3

//Else set R0 to R3
@R3
D = M //Get value of R3
@R0
M = D //Set R0 to R3's value
@END
0;JMP //Terminate program

//==================================================================
//			    BRANCHING LOGIC
//==================================================================
//R1>=R2 logic
(BRANCH_ONE)
@R1
D = M //Get value of R1
@R3
D = D - M //Subtract R3 from R1
@BRANCH_THREE
D ; JGE //If R1 >= R2, go to branch three

//If R1 is not greater than or equal to R3, then set R0 to R3
@R1
D = M //Get value of R1
@R0
M = D //Set R0 to R1
@END
0 ; JMP //Terminate program

//R1 > R3 logic
(BRANCH_THREE)
@R1
D = M //Get value of R1
@R0
M = D //Set R0 to R1
@END
0 ; JMP //Terminate program

//R2>=R3 logic
(BRANCH_TWO)
@R2
D = M //Get value of R2
@R0
M = D //Set R0 to R2
@END
0 ; JMP //Termiante program

//==================================================================
//			SAFE TERMINATION LOOP
//==================================================================
(END)
@END
0 ; JMP

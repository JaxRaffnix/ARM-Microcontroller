/*
 * Aufgabe3.S
 *
 *  Created on: 31.10.2022
 *      Author: Jan
 */

//__________________________________________________________________________
// Start

.text					// code in the following text segment
.code 32				// select arm instructions

.global _startup		// point linker to start of file
_startup:

mystart:				// label, begin of commands. End with 'stop:'

/*__________________________________________________________________________
* Third Task
* create divison program for unsigned 32bit integers
*/

	mov r0, #20			// set dividend
	mov r1, #5			// set divisor

	bl division			// call subroutine

stop:			// label, end of commands

	b stop		// infinite loop, make sure nothing weird happens at the end.

//___________________________________________________
// Subroutine

division:

	mov r2, #0			// set error register to false
	mov r4, #0			// set result (quotient) to 0

	cmp r1, #0			// check if divisor is 0
	beq divisor_is_zero	// go to branch if last flasg is high

subtraction_not_zero:


	stmfd sp!, {r4, lr}			// save register in stack
	add r4, #1			// add 1 to the result

	subs r0, r1			// subtract divisor from dividend
	// bne subtraction_not_zero	// repeat until subtraction is less then or 0
	bcs subtraction_not_zero	// repeat until subtraction is less then 0

	add r0, r1			// add divisor to dividend because underflow occured, on cycle to much
	sub r4, #1			// subtract 1 from result because of 1 cycle to much

	mov r1, r4			// copy result to r1
	//ldr r0, [r5]		// by pointer reference

	ldmfd sp!, {r4, pc}			// save register in stack
	//bx lr			// leave subroutine

divisor_is_zero:		// go here if divisor is 0

	mov r2, #1		// set error register true

	ldmfd sp!, {r4, pc}			// save register in stack
	//bx lr			// leave subroutine

//__________________________________________________________________________
// End

end_of_function:




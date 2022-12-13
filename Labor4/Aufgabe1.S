/*
 * 	Aufgabe3.S
 *
 *	Created on: 29.11.2022
 *	Author: Jan
 *
 * 	Task:
 *	Call subroutine in a subsroutine. Use stack to write programm pointer
 *
 * 	Assignment:
 *	r0	:	input
 *	r1	:	output
 *	r2	:
 *	r3	:
 *	r4	:
 *	r5	:
 *	r6	:
 *	r7	:
 *	r8	:
 *	r9	:
 *	r10	:
 *	r11	:
 *	r12	:
 *	r13	:
 *	r14	:
 *	r15	:
 */

/*__________________________________________________________________________
* Start
*	select ARM instructions, set begin of file
*/

.text					// following loc is ARM instructions
.code 32				// select ARM instructions

.global _startup		// point linker to start of file
_startup:

mystart:				// label, begin of commands. End with 'stop:'

*/__________________________________________________________________________
* Begin
*	set input to 1, call subroutine 1
*/

	ldr r0, =1			// input = 1

	bl subroutine1		// call subroutine 1

//__________________________________________________________________________
// End

stop: b stop				// infinite loop

//__________________________________________________________________________
// Subroutine 1

subroutine1:

	stmfd sp!, {r4, lr}		// save register r4 in stack

	ldr r4, =1				// set stack variable r4 to 1

	add r0, r4				// increase r1 by r4

	bl subroutine2

	ldmfd sp!, {r4, pc}		// load register r4 from stack

//__________________________________________________________________________
// Subroutine 2

subroutine2:

	stmfd sp!, {r5, lr}		// save register r5 in stack

	ldr r5, =100			// set local variable r5 to 100

	add r0, r5				// increase r1 by r5

	ldmfd sp!, {r5, pc}		// laod register r5 in stack


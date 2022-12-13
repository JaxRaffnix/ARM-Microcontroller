/*
 * Aufgabe2.S
 *
 *  Created on: 08.10.2022
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
* Second Task
* multiply two 32bit integers
*/

	mov r0, #5			// first int
	mov r1, #0			// second int

	ldr r2, =0
	ldr r3, =0

// also in this code
// r2, r3, r4, r5

second_int_positive:	// label. go here if r1=/=0

	cmp r1, #0			// set flag high if second_int ==0
	beq second_int_zero	// jump to label if second_int ==0

	adds r5, r0		// add first int to r5
	addcs r4, #1	// add 1 to r4 if overflow happens in r5 + first_int

	sub r1, #1		//	subtract 1 from second int

	bne second_int_positive	// jump to label unless equal flag is high

second_int_zero:

// Check for r1 =/= at the end of the loop is not possible, because user input could for r1 could be 0 which would lead to an ininfte loop.

//__________________________________________________________________________
// End

stop:			// label, end of commands

	b stop		// infinite loop, make sure nothing weird happens at the end.

.end			// End of File

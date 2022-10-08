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
	mov r1, #10		// second int

//	mov r2, #0			// set higher int result
//	mov r3, #0			// set lower int result

//	mov r4, #0			// set high=0
//	mov r5, #0			// set low=0

second_int_positive:	// label. go here if r1=/=0

	cmp r1, #0			// set flag high if r1==0

	beq second_int_zero	// jumo to label if r1==0

	adds r5, r5, r0		// add first int to low

	addcs r4, r4, #1	// add 1 to high if overflow happens in low+first_int

	sub r1, r1, #1		//	subtract 1 ffrom second int

	bne second_int_positive	// jump  to label unless equal flag is high

second_int_zero:

//__________________________________________________________________________
// End

stop:			// label, end of commands

	b stop		// infinite loop, make sure nothing weird happens at the end.

.end			// End of File

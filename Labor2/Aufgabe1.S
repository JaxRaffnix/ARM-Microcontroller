/*
 * Aufgabe1.S
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
* First Task
* add two 64bit integers
*/

	mov r0, #200		// integer 1 high
	ldr r1, =0x12345678	// integer 1 low

	mov r2, #10			// integer 2 high
	mov r3, #20			// integer 1 low

	ldr r4, =0
	ldr r5, =0

// also in this code:
// r4, r5

	adds r7, r1, r3		// add lower ints and store in r7
	addcs r4, r4, #1	// set increment to 1, if overflow occures in addition of lower int

	adds r6, r0, r2		// add higher ints and store in r6
	addcs r5, r5, #1	// set carry2 to 1, if overflow flag is high

	adds r6, r6, r4		// add result of high int addition and increment
	addcs r5, r5, #1	// add 1 to carry2 if overflow flag is high

//__________________________________________________________________________
// End

stop:			// label, end of commands

	b stop		// infinite loop, make sure nothing weird happens at the end.

.end			// End of File

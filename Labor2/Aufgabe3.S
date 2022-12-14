/*
 * Aufgabe3.S
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

// ________________________________________________________________________
// Define constants

//.equ Numvals, 5

/*__________________________________________________________________________
* Third Task
* get sum of two values from memory
*/

	mov r4, #5				// set counter to 5
	ldr r5, =datstart		// set r5 to pointer of value 5
	mov r7, #0				// set sum to 0

counter_not_zero:

	cmp r5, #0				// set flag high if counter == 0
	beq counter_is_zero	// jump to label if last flag is high

	ldr r6, [r5], #4		// read value from address r5, write to r6, add 4 to address in r5

// note:
// +4 equals adding 4 bytes to current pointer.
// one integer takes 4 bytes, or 32 bit

	adds r7, r7, r6			// add r6 to r7
	addcs r8, r8, #1		// add 1 to r8 if overflow occurs

	subs r4, #1
	bne counter_not_zero	// jump to label unless r4 is zero

//__________________________________________________________________________
// End

counter_is_zero:

stop:			// label, end of commands

	b stop		// infinite loop, make sure nothing weird happens at the end.

// _________________________________________________________________________
// Register Data

.data
.global datstart
datstart:
.word 0x05		// =  5 in decimal
.word 0x10		// = 16 in decimal
.word 0x15		// = 21 in decimal
.word 0x20		// = 32 in decimal
.word 0x25		// = 37 in decimal
//				  += 111 in decimal

.end			// End of File

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

//__________________________________________________________________________
// Second Task:
// add two integers with pseudo macro. Save results in new register r10.

	ldr r8, =25
	ldr r9, =204
	add r10, r8, r9

//__________________________________________________________________________
// End

stop:			// label, end of commands

	b stop		// infinite loop, make sure nothing weird happens at the end.

.end			// End of File

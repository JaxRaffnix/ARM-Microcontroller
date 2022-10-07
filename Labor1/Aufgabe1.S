/*
 * Aufgabe1.S
 *
 *  Created on: 04.10.2022
 *      Author: Jan
 *	Task: Add two registers with loops
 */

//__________________________________________________________________________
// Start

.text					// code in the following text segment
.code 32				// select arm instructions

.global _startup		// point linker to start of file
_startup:

mystart:				// label, begin of commands. End with 'stop:'

//__________________________________________________________________________
// First Task:
// add two integers with mov. Set results to new register r3.

	mov r1, #25
	mov r2, #204
	add r3, r1, r2

//__________________________________________________________________________
// End

stop:			// label, end of commands

	b stop		// infinite loop, make sure nothing weird happens at the end.

.end			// End of File

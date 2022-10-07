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


//__________________________________________________________________________
// Third Task:
// start addition loop until overflow happens.
// Results: Overflow after 4.294.967.295 = 2^32 -1

	mov r5, #4294967291
	mov r6, #1

loop:

	add r5, r5, r6
	b loop

//__________________________________________________________________________
// End

stop:			// label, end of commands

	b stop		// infinite loop, make sure nothing weird happens at the end.

.end			// End of File

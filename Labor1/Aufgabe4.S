/*
 * Aufgabe4.S
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
// Fourth task:
// run program for 1 minute, increment in each loop by 1 starting with 0.
// Results: after 1 min, the program counted from 0 to 424637060. 5 commands per loop, so 2123185300 executions in total. This is equal to 35,4 * 10^6 Hz (1/s).

	mov r5, #0
	mov r6, #1

loop:

	mov r7,r5
	adds r5, r5, r6
	bcc loop

//__________________________________________________________________________
// End

stop:			// label, end of commands

	b stop		// infinite loop, make sure nothing weird happens at the end.

.end			// End of File

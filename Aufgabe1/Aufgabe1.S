/*
 * Aufgabe1.S
 *
 *  Created on: 04.10.2022
 *      Author: Jan
 *	Task: Add two registers with loops
 */

//__________________________________________________________________________

.text					// code in the following text segment
.code 32				// select arm instructions

.global _startup		// point linker to start of file
_startup:

mystart:				// label, begin of commands. End with 'stop:'

//__________________________________________________________________________

// First Task:
// add two integers with mo. Set results to new register r3.

	mov r1, #25
	mov r2, #204
	add r3, r1, r2

//__________________________________________________________________________

// Second Task:
// add two integers with pseudo macro. Set results to new register r10.

	ldr r8, =25
	ldr r9, =204
	add r10, r1, r2

//__________________________________________________________________________

// Third Task:
// start addition loop until overflow happens.
// last addition result is stored in register r7.
// Results: Overflow after 4.294.967.295 = 2^32 -1

	//mov r5, #4294967291
	//mov r6, #1

//loop:

//	add r5, r5, r6
//	b loop

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

stop:			// label, end of commands

	b stop		// infinite loop, make sure nothing weird happens at the end.

.end			// End of File

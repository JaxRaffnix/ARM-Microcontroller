/*
 * Aufgabe2.S
 *
 *  Created on: 29.11.2022
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
* add two integers in bcd
*/

	ldr r0, =0x13			// input: value1 18 dec
	ldr r1, =0x18			// input: value2 18 dec

	bl addition

//__________________________________________________________________________
// End

stop:			// label, end of commands

	b stop		// infinite loop, make sure nothing weird happens at the end.

//__________________________________________________________________________
// bcd addition

addition:

	stmfd sp!, {r4-r9, lr}		// save r4 to r9 in stack

	ldr r4, =8					// count = 8
	ldr r5, =0x0f				// mask = 15
	ldr r6, =0					// carry = 0
	ldr r7, =0					// result = 0

count_not_zero:

	cmp r4, #0					// if count == 0
	beq count_is_zero			// goto label. Otherwise continue

	and r8, r0, r5				// temp1 = value1 AND mask
	and r9, r1, r5				// temp2 = value2 AND mask

	add r8, r8, r9				// temp1 += temp2
	add r8, r8, r6				// temp1 += carry

	subs r8, #10					// temp1 -= 10
	bcs subtraction_not_negative 	// if temp1 >= 0 goto label

	// if temp1 < 0:
	add r8, r8, #10				// add 10 to temp1
	ldr r6, =0				// set carry to false
	b subtraction_is_negative

subtraction_not_negative:
	ldr r6, =1					// carry = 1
subtraction_is_negative:

	add r7, r7, r8				// result += temp1

	ror r0, #4				// right shift rotate by 4 bit
	ror r1, #4
	ror r7, #4

	sub r4, #1				// count -= 1

	b count_not_zero

count_is_zero:

	mov r2, r7				// output: r2 = result
	mov r3, r6				// output: r3 = carry

	ldmfd sp!, {r4-r9, pc}			// load r4 to r9 in stack

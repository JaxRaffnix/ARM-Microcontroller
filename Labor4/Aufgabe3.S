/*
 * 	Aufgabe3.S
 *
 *	Created on: 29.11.2022
 *	Author: Jan
 *
 * 	Task:
 *
 *
 * 	Zuweisung:
 *	r0	:	pointer1
 *	r1	:	pointer2
 *	r2	:
 *	r3	:
 *	r4	:	increment
 *	r5	:	lower value1
 *	r6	:	lower value2
 *	r7	:
 *	r8	:
 *	r9	:	temp1
 *	r10	:	temp2
 *	r11	:	increment
 *	r12	:
 *	r13	:
 *	r14	:
 *	r15	:
 */

//__________________________________________________________________________
// Start


.text					// code in the following text segment
.code 32				// select arm instructions

.global _startup		// point linker to start of file
_startup:

mystart:				// label, begin of commands

/*__________________________________________________________________________
* Third Task
* add two 64 bit integers with pointers
*/

	bl addition			// go to subrotuine addition

//__________________________________________________________________________
// End

stop:	b stop					// infinite loop

//__________________________________________________________________________
// bcd addition

addition:

	stmfd sp!, {r4-r11, lr}		// save register r1 in stack

	ldr r11, #0					// set increment to 0

	ldr r5, #0					// set lower value1 to 0
	ldr r0, [r5]				// set pointer1 to lower value1 to 0

	ldr r6, #0					// set lower value2 to 0
	ldr r1, [r6]				// set pointer2 to lower value2 to 0

	ldr r4, #0					// set increment to 0

	ldr r9, r0					// set tem1 to pointer1 of lower value1
	ldr r10, r1					// set tem2 to pointer2 of lower value2
	add r1, #1					// add 1 to pointer of lower value2

	add r9, r9, r10				// add tem2 to tem1
	ldr r0, r9					// save tem1 at pointer1
	add r0, #1					// add 1 to pointer1

	cmp r9, 0xFFFFFFFF			// check if tem1 is 2^32-1
	bne tem_is_max

	ldr r11 #1					// set increment to 1

	ldr r9, r0					// set tem1 to pointer1
	add r9, r9, r11				// add increment to tem1

	ldr r10, r1					// set tem2 to pointer2
	add r9, r9, r10				// add tem2 to tem1

	ldr r0, r9					// set pointer1 to tem1

	ldmfd sp!, {r4-r11, pc}			// save register in stack
tem_is_max:

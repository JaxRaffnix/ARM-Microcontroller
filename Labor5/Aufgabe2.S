/*
 * 	Aufgabe2.S
 *
 *	Created on: 29.11.2022
 *	Author: Jan
 *
 * 	Task:
 *	Aktivate a lead, deactivate the previous one. repeat in a loop for all 8 leds.
 *
 * 	Zuweisung:
 *	r0	:	adress of io pins 0
 *	r1	:	bit mask leds high
 *	r2	:	adress of io set
 *	r3	:	bit mask to set first led high
 *	r4	:	adress of io reset
 *	r5	:	bit mask to reset first led
 *	r6	:	delay counter
 *	r7	:
 *	r8	:
 *	r9	:
 *	r10	:
 *	r11	:
 *	r12	:
 *	r13	:
 *	r14	:
 *	r15	:
 */

//__________________________________________________________________________
// Start


.text					// code in the following text segment
.code 32				// select arm instructions

// Adress for pins in device memory
.equ IOPIN0, 0xE0028000
//.equ IODIR1, 0xE0028018
.equ IOSET1, 0xE0028014
.equ IOCLR1, 0xE002801C

// constants
.equ delay_length, 0xafffff
.equ stackpointer_start, 0x40001000
.equ iopin_set, 0xff0000
.equ led_set, 0x10000
.equ led_reset, 0x8000
.equ reset_condition, 0x2000000

.global _startup		// point linker to start of file
_startup:

mystart:				// label, begin of commands

/*__________________________________________________________________________
* Second Task
* Aktivate a lead, deactivate the previous one. repeat in a loop for all 8 leds.
*/

	ldr sp, =stackpointer_start	// set stack pointer

	ldr r0, =IOPIN0				// r1 == address (io pins 0)
	ldr r1, =iopin_set			// leds high bit mask
	str r1, [r0]				// write to adress of r0 the bit mask to set leds

	ldr r2, =IOSET1
	ldr r3, =led_set			// set bit mask to activate leds

	ldr r4, =IOCLR1
	ldr r5, =led_reset			// bit mask to deactivate led

loop:
	bl delay

	str r3, [r2]				// use set bit mask to aktivate led
	lsl r3, r3, #1				// left shift set bitmask

	str r5, [r4]				// use clear bit mask to deactivate led
	lsl r5, r5, #1				// left shift clear bit mask

	cmp r3, #reset_condition
	bleq reset

	b loop						// jump to lable

//__________________________________________________________________________
// Delay

delay:
	ldr r6, =delay_length		// save delay counter to temp storage
delay_loop:
	subs r6, #1					// count down by 1 until 0 is reached
	bne delay_loop
	ldr r6, =delay_length		// reset delay counter to initial value
	bx lr

//__________________________________________________________________________
// Reset

reset:
	ldr r3, =led_set
	ldr r5, =led_reset
	bx lr

.end							// end of file

/*
 * 	Aufgabe1.S
 *
 *	Created on: 29.11.2022
 *	Author: Jan
 *
 * 	Task:
 *	Aktivate 8 LEDs one after another until all are glowing.
 *
 * 	Zuweisung:
 *	r0	:	adress of io pins 0
 *	r1	:	bit mask leds high
 *	r2	:	adress of io set
 *	r3	:	bit mask to set first led high
 *	r4	:	loop counter
 *	r5	:	delay counter
 *	r6	:
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

// Adresses for pins in device memory
.equ IOPIN0, 0xE0028000
//.equ IODIR1, 0xE0028018
.equ IOSET1, 0xE0028014
//.equ IOCLR1, 0xE002801C

// constants
.equ delay_length, 0xafffff
.equ stackpointer_start, 0x40001000
.equ iopin_set, 0xff0000
.equ led_set, 0x10000
.equ loop_repition, 7

.global _startup		// point linker to start of file

_startup:

mystart:				// label, begin of commands

/*__________________________________________________________________________
* First Task
* light up 8 leds one after another
*/

	ldr sp, =stackpointer_start	// set stack pointer

	ldr r0, =IOPIN0				// r1 == address (io pins 0)
	ldr r1, =iopin_set			// leds high bit mask
	str r1, [r0]				// write to adress of r0 the bit mask to set leds

	ldr r4, =loop_repition		// set loop counter to 7

	ldr r2, =IOSET1				// r2 == adress (io set)
	ldr r3, =led_set		// bit mask to set 1 led high

loop:
	bl delay

	str r3, [r2]				// write bit mask to aktivate led to adress of io set
	lsl r3, r3, #1				// left shift bitmask by 1

	subs r4, #1					// decrement loop counter
	bcs loop					// jump to lable, while loop counter >=0

//__________________________________________________________________________
// End

stop:	b stop					// infinite loop

//__________________________________________________________________________
// Delay

delay:
	ldr r5, =delay_length		// save delay counter to temp storage
delay_loop:
	subs r5, #1					// count down by 1 until 0 is reached
	bne delay_loop
	ldr r5, =delay_length		// reset delay counter to initial value
	bx lr

.end							// end of file

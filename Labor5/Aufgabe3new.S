/*
 * 	Aufgabe3new.S
 *
 *	Created on: 29.11.2022
 *	Author: Jan
 *
 * 	Task:
 *	switch status of 2 led when button is pressed. 4 push buttons , 8 output leds
 *
 * 	Zuweisung:
 *	r0	:	address of io pins
 *	r1	:	address of io set
 *	r2	:	address of io clear
 *	r3	:	bit mask button
 *	r4	:	holds iopin_set, addition result and bit masks
 *	r5	:	bit mask led1
 *	r6	:	bit mask led2
 *	r7	:
 *	r8	:
 *	r9	:
 *	r10	:
 *	r11	:	delay counter
 *	r12	:
 *	r13	:
 *	r14	:
 *	r15	:
 */

//__________________________________________________________________________
// Start

.text					// code in the following text segment
.code 32				// select arm instructions

// address for pins in device memory
.equ IOPIN0, 0xE0028000
//.equ IODIR1, 0xE0028018
.equ IOSET1, 0xE0028014
.equ IOCLR1, 0xE002801C
.equ BUTTON1, 0x400
//.equ BUTTON2, 0x800
//.equ BUTTON3, 0x1000
//.equ BUTTON4, 0x2000

//constants
.equ delay_length, 0xafffff
.equ stackpointer_start, 0x40001000
.equ iopin_set, 0xff0000
.equ led1, 0x10000
.equ led2, 0x20000

.global _startup		// point linker to start of file
_startup:


mystart:				// label, begin of commands

/*__________________________________________________________________________
* Third Task
* change led depening on push button input
*/

	ldr r0, =IOPIN0				// r0 == address (io pins 0)
	ldr r4, =iopin_set			// leds high bit mask
	str r4, [r0]				// write to address of r0 the bit mask to set leds

	ldr r1, =IOSET1
	ldr r2, =IOCLR1

main:

	ldr r3, =BUTTON1			// bit mask button1
	ldr r5, =led1				// r4 = bit mask led1
	ldr r6, =led2				// r5 = bit mask led2
	bl check_button

	bl check_button

	bl check_button

	bl check_button

	b main

//__________________________________________________________________________
// check for button pressed

check_button:

	//bl delay

	ldr r4, [r0]				// r4 = value at address of io pin
	ands r4, r4, r3				// r4 = value at address of io pin + bit mask button
	beq button_is_pressed

//not pressed:
	str r5, [r2]				// value at adress of io clear = bit mask led1
	str r6, [r1]				// value at address of io set = bit mask led2

	b setup_next_button

button_is_pressed:
	str r5, [r1]
	str r6, [r2]

setup_next_button:

	lsl r3, r3,	#1				// left shift bit mask to next button
	lsl r5, r5, #2				// left shift bit mask for led1 to led3
	lsl r6, r6, #2				// left shift bit mask for led2 to led4

	bx lr

//__________________________________________________________________________
// Delay

delay:
	ldr r11, =delay_length		// save delay counter to temp storage
delay_loop:
	subs r11, #1				// count down by 1 until 0 is reached
	bne delay_loop
	ldr r11, =delay_length		// reset delay counter to initial value
	bx lr

.end 					// end of file

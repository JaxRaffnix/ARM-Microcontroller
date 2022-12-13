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
 *	r0	:
 *	r1	:
 *	r2	:
 *	r3	:
 *	r4	:
 *	r5	:
 *	r6	:
 *	r7	:
 *	r8	:
 *	r9	:
 *	r10	:
 *	r11	:
 *	r12	:
 *	r1	:
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
.equ BUTTON1, 0x400
.equ BUTTON2, 0x800
.equ BUTTON3, 0x1000
.equ BUTTON4, 0x2000

//constants
.equ delay_length, 0xffff
.equ stackpointer_start, 0x40001000
.equ iopin_high, 0xff0000
.equ set_led_1, 0x10000
.equ set_led_2, 0x20000
.equ reset_led_1, 0x10000
.equ reset_led_2, 0x20000

.global _startup		// point linker to start of file
_startup:


mystart:				// label, begin of commands

/*__________________________________________________________________________
* Third Task
* change led depening on push button input
*/

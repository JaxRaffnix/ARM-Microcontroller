/*
 * 	Aufgabe3.S
 *
 *	Created on: 29.11.2022
 *	Author: Jan
 *
 * 	Task:
 *	switch status of 2 led when button is pressed. 4 push buttons , 8 output leds
 *
 * 	Zuweisung:
 *	r0	:	adress		io pins 0
 *	r1	:	bit mask 	leds high
 *	r2	:	adress 		io set
 *	r3	:	bit mask 	set led
 *	r4	:	adress 		io reset
 *	r5	:	bit mask 	reset led
 *	r6	:	address 	button1 -- button4
 *	r7	:	value 		io pins at adress of r0
 *	r8	:	value		button increment
 *	r9	:	value		delay length
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
.equ IODIR1, 0xE0028018
.equ IOSET1, 0xE0028014
.equ IOCLR1, 0xE002801C

.equ BUTTON1, 0x400
.equ BUTTON2, 0x800
.equ BUTTON3, 0x1000
.equ BUTTON4, 0x2000

.global _startup		// point linker to start of file
_startup:

.equ delay_length, 0xffff
.equ stackpointer_start, 0x40001000
.equ iopin_high, 0xff0000
.equ set_led_1, 0x10000
.equ set_led_2, 0x20000
.equ reset_led_1, 0x10000
.equ reset_led_2, 0x20000

mystart:				// label, begin of commands

/*__________________________________________________________________________
* Third Task
* change led depening on push button input
*/

	ldr sp, =stackpointer_start	// set stack pointer

	ldr r0, =IOPIN0				// r1 = address (io pins 0)
	ldr r1, =iopin_high			// leds high bit mask
	str r1, [r0]				// adress (io pins 0) = bit mask leds high

	ldr r2, =IOSET1
	ldr r4, =IOCLR1

	ldr r8, =0					// button increment = 0

	ldr r10, =set_led_1
	ldr r11, =reset_led_1
	ldr r12, =set_led_2
	ldr r1, =reset_led_2

main:
	ldr r6, =BUTTON1			// r6 = adress (button 1)
	ldr r8, =0x00000			// button increment = 0
	bl check_button

	ldr r6, =delay_length		// start delay with 200 cylces
	bl delay

	ldr r6, =BUTTON2			// r6 = adress (button 2)
	add r8, r8, #0x20000			// button increment += 2
	bl check_button

	ldr r9, =delay_length		// start delay with 200 cylces
	bl delay

	ldr r6, =BUTTON3			// r6 = adress (button 3)
	add r8, r8, #0x20000			// button increment += 2
	bl check_button

	ldr r6, =delay_length		// start delay with 200 cylces
	bl delay

	ldr r6, =BUTTON4			// r6 = adress (button 4)
	add r8, r8, #0x20000			// button increment += 2
	bl check_button

	ldr r6, =delay_length		// start delay with 200 cylces
	bl delay

	b main						// infinite loop

//__________________________________________________________________________
// check button

check_button:

	ldr r7, [r0]				// r7 = io pin values
	ands r7, r6, r7			// add io pin values and button1 adress
	beq button_is_pressed		// jump to label, if overflow in addition
	b button_not_pressed

button_is_pressed:
	//set led1, reset led2
	add r3, r10, r8			// bit mask led set = address (led1) + button increment
	add r5, r1, r8			// bit mask led reset = address (led2) + button increment

	str r3, [r2]			// io set = bit mask led set
	str r5, [r4]			// io reset = bit mask led reset

	b return

button_not_pressed:
	// set led2, reset led1
	add r3, r12, r8			// bit mask led set = adress (led2) + button increment
	add r5, r11, r8			// bit mask led reset = adress (led1) + button increment

	str r3, [r2]			// io set = bit mask led set
	str r5, [r4]			// io reset = bit mask led reset

return:
	bx lr

//__________________________________________________________________________
// Delay

delay:
	subs r9, #1					// count down by 1 until 0 is reached
	bne delay
	bx lr

.end

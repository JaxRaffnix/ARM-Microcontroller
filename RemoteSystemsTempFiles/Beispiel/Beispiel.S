/*
 * Beispiel.S
 *
 *  Created on: 29.09.2022
 *      Author: Jan
 */


.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global _startup /* Specify global symbol */
_startup:
mov r0, #0 /* this is just a dummy value to check register r0 */
mov r1, #1 /* this is just a dummy value to check register r1 */
mov r2, #2 /* this is just a dummy value to check register r2 */
mov r3, #3 /* this is just a dummy value to check register r3 */
mov r4, #4 /* this is just a dummy value to check register r4 */
mov r5, #5 /* this is just a dummy value to check register r5 */
mov r6, #6 /* this is just a dummy value to check register r6 */
mov r7, #7 /* this is just a dummy value to check register r7 */
mov r8, #8 /* this is just a dummy value to check register r8 */
mov r9, #9 /* this is just a dummy value to check register r9 */
mov r10, #10 /* this is just a dummy value to check register r10 */
mov r11, #11 /* this is just a dummy value to check register r11 */
mov r12, #12 /* this is just a dummy value to check register r12 */
stop:
nop
bal stop
.end

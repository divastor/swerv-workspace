// ; startup code to support HLL programs
// ; snatched from $RV_ROOT/testbench/asm/crt0.s

#include "defines.h"

#define RAM_INIT_DONE   0x8000100A
#define SIM_PRINT       0x80001008
#define SIM_EXIT        0x80001009

.section .text.init
.global _start
_start:
        // la sp, STACK

    	// csrw minstret, zero
    	// csrw minstreth, zero

    	li x1, 0x55555555
    	csrw 0x7c0, x1

	/* Wait until RAM initialization is done */
	li	t1, RAM_INIT_DONE
1:	lbu	t2, 0(t1)
	beqz	t2, 1b
	la	a5, ram_ok
	jal	print
    
    /* poc */
    jal smc_snippet
    
    /* output result */
    add  a5, a0, zero
    jal print
        // call main

.global _finish
_finish:
        la t0, tohost
#ifdef IS_WHISPER
        li t1, 1
        sw t1, 0(t0)
#else
        li t1, 0xff
        sw t1, 0(t0)
#endif
    li t0, SIM_EXIT
	sb zero, 0(t0)
        beq x0, x0, _finish
        .rept 10
        nop
        .endr

.section .text
print:
	/* Load console address to a0 */
	li  a0,     SIM_PRINT

	/* Load first byte */
	lb t0, 0(a5)
next:
	/* Write to console and load next char until we get \0 */
	sb t0, 0(a0)
	addi a5, a5, 1
	lb t0, 0(a5)
	bne t0, zero, next
    
    ret

.section .data.io
.global tohost
tohost: .word 0

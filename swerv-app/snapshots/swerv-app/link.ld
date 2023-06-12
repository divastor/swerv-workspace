/*
 NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE
 This is an automatically generated file by stavros on Τετ 02 Μαρ 2022 07:35:18 μμ EET

 cmd:    swerv -snapshot=swerv-app -unset=assert_on -set=reset_vec=0x80000000 -set=fpga_optimize=1 

*/

OUTPUT_ARCH( "riscv" )
ENTRY(_start)

SECTIONS
{
  . = 0x00000000;
  .text.init .  : { *(.text.init) }
  
  .text . : { *(.text) }
  _end = .;
  /* . = 0xd0580000;
  .data.io .  : { *(.data.io) } */
    . = 0x00004000 ;
  .data  :  ALIGN(0x800) { *(.*data) *(.rodata*)}
  .bss :  {BSS_START = .; *(.*bss)}
  BSS_END = .;
  STACK = ALIGN(16) + 0x1000;
  
    . = 0x00004ff8; .data.ctl : { LONG(0x07f40000); LONG(STACK) }
}


.global _start

.section .text
_start:
movq (num), %rax
movq $0x1, %rbx
movb $0x0, %cl
LOOP_HW1: cmpq %rbx, $0x0
je END_HW1
testq %rax, %rbx
je AFTER_ADDING_BIT_HW1
incb %cl
AFTER_ADDING_BIT_HW1: salq %rbx
jmp LOOP_HW1
END_HW1: movb %cl, (Bool)

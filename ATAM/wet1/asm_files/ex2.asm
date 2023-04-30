.global _start

.section .text
_start:
movl (num), %eax
movl $0x0, %edx
cmp %eax, $0x0
jl NEG_HW1
movq $source, %rbx
cmp %rbx, $destination
jb DST_BEFORE_SRC_HW1
SRC_BEFORE_DST_HW1:cmp %eax, $0x0
je END_HW1
decl %eax
movb source(,%eax,$0x1), %cl
movb %cl, destination(,%eax,$0x1)
jmp SRC_BEFORE_DST_HW1
DST_BEFORE_SRC_HW1:cmp %edx, %eax
je END_HW1
movb source(,%edx,$0x1), %cl
movb %cl, destination(,%edx,$0x1)
inc %edx
jmp DST_BEFORE_SRC_HW1
NEG_HW1: movl %eax, destination
END_HW1:
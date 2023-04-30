.global _start

.section .text
_start:

movq $0x0, %rax
movq $0x0, %rbx
movq $0x0, %r8
movl array1, %ecx
movl array2, %edx
MAIN_LOOP_HW1: cmpl %ecx, %edx
je EQUAL_HW1
jg INSERT_FROM_ARRAY2_HW1

INSERT_FROM_ARRAY1_HW1: %ecx, mergedArray(,%r8,$0x4)
INSERT_FROM_ARRAY1_LOOP_HW1: inc %rax
movl array1(,%rax,$0x4), %ecx
cmp %ecx, mergedArray(,%r8,$0x4)
je INSERT_FROM_ARRAY1_LOOP_HW1
inc %r8
jmp MAIN_LOOP_HW1

EQUAL_HW1: movl %ecx, mergedArray(,%r8,$0x4)
cmpl %ecx, $0x0
je END_HW1
INC_ARRAY1_HW1: inc %rax
movl array1(,%rax,$0x4), %ecx
cmp %ecx, mergedArray(,%r8,$0x4)
je INC_ARRAY1_HW1

INC_ARRAY2_HW1: inc %rbx
movl array2(,%rbx,$0x4), %edx
cmp %edx, mergedArray(,%r8,$0x4)
je INC_ARRAY2_HW1
inc %r8
jmp MAIN_LOOP_HW1


INSERT_FROM_ARRAY2_HW1: %edx, mergedArray(,%r8,$0x4)
INSERT_FROM_ARRAY2_LOOP_HW1: inc %rbx
movl array2(,%rbx,$0x4), %edx
cmp %edx, mergedArray(,%r8,$0x4)
je INSERT_FROM_ARRAY2_LOOP_HW1
inc %r8
jmp MAIN_LOOP_HW1

END_HW1:
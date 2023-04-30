.global _start

.section .text
_start:


movq head, %rax # temp
movl value, %ebx
movq $source, %r9
movq $0x0, %rdx

cmpq head, $0x0 #if list is empty
je END_HW1 #return

cmpl (%rax), %ebx
je HEAD_IS_PERV_OF_VALUE_HW1

FIND_VAL_HW1: cmpq 4(%rax), $0x0
je END_HW1
movq 4(%rax), %r10
cmpl (%r10), %ebx
je VAL_FOUND_PTRS_HW1
movq %r10, %rax
jmp FIND_VAL_HW1

VAL_FOUND_PTRS_HW1: movq %r10, %rdx
movq %rax, %rcx
jmp FIND_PREV_SOURCE_HW1

HEAD_IS_PERV_OF_VALUE_HW1: movq %rax, %rdx #val_ptr = temp
movq $head, %rcx #val_prev = head

FIND_PREV_SOURCE_HW1: movq head, %rax
cmpq %rax, %r9#if source is the first node
jne FIND_SOURCE_PREV_LOOP_HW1
movq $head, %r8
jmp SWAP_PTRS_HW1

FIND_SOURCE_PREV_LOOP_HW1:movq 4(%rax), %r10
cmpq %r10, %r9
je SOURCE_PREV_FOUND_HW1
movq %r10, %rax
jmp FIND_SOURCE_PREV_LOOP_HW1

SOURCE_PREV_FOUND_HW1: movq %rax, %r8

SWAP_PTRS_HW1: cmpq %r8, $head
je SOURCE_IS_FIRST_HW1
movq %rdx, 4(%r8)
jmp CHANGE_PREV_OF_VALUE_HW1

SOURCE_IS_FIRST_HW1: movq %rdx, %r8

CHANGE_PREV_OF_VALUE_HW1: cmpq %rcx, $head
je VALUE_IS_FIRST_HW1
movq %r9, 4(%rcx)
jmp CHANGE_NEXT_OF_BOTH_HW1

VALUE_IS_FIRST_HW1: movq %r9, %rcx

CHANGE_NEXT_OF_BOTH_HW1:movq 4(%r9), %rax
movq 4(%rdx), %r11
movq %r11, 4(%r9)
movq %rax, 4(%rdx)

END_HW1:
%include "io.inc"
section .data
tt db 10, 9, 8, 7, 6

section .text
global main
main:
    mov rbp, rsp; for correct debugging
    mov rcx, -1
    lea rbx, [tt] 
    mov eax, [rbx]
    imul ecx
    nop
    ret
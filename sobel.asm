; Wiener deconvolution using sequential programming

section .text
    ;global sobel_sp
    
sobel_sp:
    ; RCX = src, RDX = dst, R8 = width, R9 = height
    push rbp
    mov rbp, rsp
    sub rsp, 32

    ; Save registers
    mov [rsp], rbx
    mov [rsp+8], r12
    mov [rsp+16], r13
    mov [rsp+24], r14
    
    ; Setup parameters
    mov r10, rcx        ; Source pointer
    mov r11, rdx        ; Destination pointer
    mov r12, r8         ; Width
    mov r13, r9         ; Height
    
    ; Initialize the destination with zeros
    mov rcx, r12        ; copy width to rcx
    imul rcx, r13       ; multiply WxH for dimensions
    xor rax, rax        ; clear rax
    mov rdi, r11        ; destination pointer
    
    xor rbx, rbx        ; Clear rbx, current index
    xor r8, r8          ; Row reference
    xor r9, r9          ; column reference
    
    ; Set up first value
    ; start program by checking
Start:
    cmp rbx, rcx-1

    cmp r8, 0
    je Setup_next
    cmp r8, r12
    jge Setup_next
    
    cmp r9, 0
    je Setup_next
    cmp r9, r13
    jge Setup_next

sobel_solve:
    ; Solve for Ix of n
    
    sub rbx, r13      ; Previous row
    sub rbx, 1        ; Get top left corner of kernel
    ; perform something
    add rbx, 2        ; Top right of kernel
    ; do something
    add rbx, r13      ; Middle right of kernel
    ; do something
    sub rbx, 2        ; Middle left of kernel
    ; Do something
    add rbx, r13      ; Bottom left of kernel
    ; do something 
    add rbx, 2        ; Bottok right of kernel
    ; do something

    ; Get the avg of results
    ; Store somewhere 
    sub rbx, r13+1

    ; Solve for Iy of n


    ; Square Ix and Iy
    ; Add Ix and Iy
    ; Get the square root of the sum
    ; Compare the result with the threshold
    ; If result > thresh, store 255
    ; Else, store 0

Setup_nxt:
    ; Increment count
    
    ; loopback here
L1:
    ; Check if it is first||last row && first||last col
    ;cmp 
        
    ; compute for Ix
    ;mov 
    
    ; Compute for Iy
    
    ; Sqrt(ix^2+iy^2)
    
    ; Check for threshold
    
Col_nxt:
    inc rbx
    inc r9
    jmp Start   ; Update jump to check if end of column

Row_nxt:
    ; Reset row index
    ; Jump back to start

Prog_end:
    ; Store/Update destination / Save results into Destination matrix
    ; Restore pushed registers
    ret

section .note.GNU-stack

global resistance
extern get_resistance
extern compute_resistance
extern show_resistance
extern printf
default rel

section .data
    msg_start db "Starting resistance calculation...", 0
    msg_end db "Calculation complete.", 0

section .bss
    ticks_start resq 1
    ticks_end resq 1
    res1 resq 1
    res2 resq 1
    res3 resq 1
    res4 resq 1

section .text
resistance:
    ; Make resistance visible
    global resistance

    ; Print start message
    sub rsp, 32
    lea rdi, [msg_start]
    xor rax, rax
    call printf
    add rsp, 32

    ; Get start ticks
    rdtsc
    shl rdx, 32
    or rax, rdx
    mov [ticks_start], rax

    ; Call get_resistance
    sub rsp, 32
    lea rdi, [res1]
    call get_resistance
    add rsp, 32

    ; Use cpuid instruction
    xor rax, rax
    cpuid

    ; Load resistances into xmm registers for computation
    movsd xmm0, qword [res1]
    movsd xmm1, qword [res2]
    movsd xmm2, qword [res3]
    movsd xmm3, qword [res4]

    ; Call compute_resistance
    sub rsp, 32
    mov rdi, qword [res1]
    mov rsi, qword [res2]
    mov rdx, qword [res3]
    mov rcx, qword [res4]
    xor r8, r8
    call compute_resistance
    movsd qword [rsp], xmm0

    ; Convert result from integer to float
    mov rax, [rsp]
    cvtsi2sd xmm0, rax

    ; Get end ticks
    rdtsc
    shl rdx, 32
    or rax, rdx
    mov [ticks_end], rax

    ; Calculate tick difference
    mov rax, [ticks_end]
    sub rax, [ticks_start]

    ; Call show_resistance
    mov rdi, rax  ; ticks 
    mov rsi, [rsp]; resistance    
    call show_resistance

    ; Print end message
    sub rsp, 32
    lea rdi, [msg_end]
    xor rax, rax
    call printf
    add rsp, 32

    ; Clean up and return the result
    add rsp, 32
    ret


section .data
double_two: dq 2.0
double_sign_bit: dq 0x8000000000000000
double_zero: dq 0.0

section .text
global compute_area
extern sqrt

compute_area:
    ; Expecting pointer to three double values (sides a, b, c) in rdi
    ; and pointer to result in rsi
    movq xmm0, [rdi]         ; Load side a
    movq xmm1, [rdi + 8]     ; Load side b
    movq xmm2, [rdi + 16]    ; Load side c

    movq xmm3, xmm0
    addsd xmm3, xmm1         ; s = a + b
    addsd xmm3, xmm2         ; s = s + c
    movq xmm4, xmm3
    divsd xmm4, [rel double_two] ; s = s / 2 (semiperimeter)

    movq xmm5, xmm4
    subsd xmm5, xmm0         ; s - a
    movq xmm6, xmm4         ; Copy s to another register
    subsd xmm6, xmm1         ; s - b

    ; Use the PLT to access sqrt in a position-independent way
    mov rax, [rel sqrt wrt ..gotpc]
    movsd xmm0, xmm5         ; Move s - a to xmm0 for sqrt
    call rax                 ; Call sqrt via GOT
    movsd xmm5, xmm0         ; Move the result back to xmm5

    movq [rsi], xmm5         ; Store the result back at the pointer location

    ret
section .text
global process_triangle
extern get_sides, compute_area, show_results

process_triangle:
    sub rsp, 40              ; Allocate stack space for 5 doubles

    lea rdi, [rsp]           ; Pass address of side1
    lea rsi, [rsp+8]         ; Pass address of side2
    lea rdx, [rsp+16]        ; Pass address of side3
    call get_sides           ; Call get_sides(double*, double*, double*)
    test al, al              ; Check if input was successful
    jz   exit                ; If input failed, skip to exit

    lea rdi, [rsp]           ; Pass address of sides array to compute_area
    lea rsi, [rsp+24]        ; Pass address of result to compute_area
    call compute_area        ; Call compute_area(double*, double*)

    movq xmm0, [rsp+24]      ; Load computed area into xmm0 for passing to show_results
    call show_results        ; Call show_results(double)

exit:
    add rsp, 40              ; Clean up stack
    ret
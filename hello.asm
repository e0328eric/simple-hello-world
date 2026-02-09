format binary
use64

;; rdi <- printf pointer
;; rsi <- scanf pointer
main_prob:
    push   rbp
    mov    rbp, rsp
    sub    rsp, 0x40
    mov    QWORD [rsp+0x30], rdi ;; save printf pointer
    movdqu  xmm0, [baseA]
    movdqu  xmm1, [baseB]
    pmaddwd xmm0, xmm1
    movdqu  xmm2, [remA]
    movdqu  xmm3, [remBmask]
    pmaddwd xmm2, xmm3
    paddd   xmm0, xmm2
    movdqu  [rsp], xmm0
    lea  rdi, [rsp]
    call QWORD [rsp+0x30]
    leave
    ret

align 16
baseA:
    dw 32767, 22747, 32767, 11842, 32767, 18651, 0, 0
baseB:
    dw 32767, 32767, 32767, 32767, 32767, 32767, 32767, 32767
remA:
    dw 15906, 0, 23216, 0, 15177, 0, 2593, 0
remBmask:
    dw 1, 0, 1, 0, 1, 0, 1, 0

format binary
use64

;; rcx <- printf pointer
;; rdx <- scanf pointer
main_prob:
    push   rbp
    mov    rbp,rsp
    sub    rsp,20h
    mov    QWORD [rbp-0x8], rcx
    lea    rcx, [hello]
    call   QWORD [rbp-0x8]
    leave
    ret

hello: db "Hello, World!", 10, 0

format binary
use64

;; rdi <- printf pointer
;; rsi <- scanf pointer
main_prob:
    push   rbp
    mov    rbp,rsp
    sub    rsp,0x10
    mov    QWORD [rsp+0x8], rdi
    lea    rdi, [hello]
    call   QWORD [rsp+0x8]
    leave
    ret

hello: db "Hello, World!", 10, 0

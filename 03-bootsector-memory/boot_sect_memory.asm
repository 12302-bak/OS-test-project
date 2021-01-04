mov ah, 0x0e ;tty mode

; attempt 1
; Fails because it tries to print the memory address(i.e pointer)
; not its actual contents

mov al, "1"
int 0x10
mov al, the_secret
int 0x10

mov al, '2'
int 0x10
mov al, [the_secret]

mov al, "3"
int 0x10
mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10

mov al, '4'
int 0x10
mov al, [0x7c2B]
int 0x10

jmp $

the_secret:
	db "X"

times 510-($-$$) db 0
dw 0xaa55


int 0x10

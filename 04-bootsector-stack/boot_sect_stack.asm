mov ah, 0x0e; tty mode

mov bp, 0x8000 ;this is an address far away from 0x7c00 so that we don't get overwritten
mov sp,bp 

push 'A'
push 'B'
push 'C'

;to show how the stack grows downwards
mov al, [0x7ffe]
int 0x10

mov al, [0x7fff]
int 0x10

mov al, [0x7ffc]
int 0x10

mov al, [0x8000]
int 0x10

pop bx 
mov al, bl
int 0x10 

pop bx
mov al, bl
int 0x10

pop bx 
mov al, bl
int 0x10

; data that has been pop'd from the stack is grabage now
mov al, [0x8000]
int 0x10

jmp $
times 510-($-$$) db 0
dw 0xaa55

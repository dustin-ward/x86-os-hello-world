[org 0x7c00]
mov ah, 0x0e
mov bx, str

loop:
    mov al, [bx]
    cmp al, 0 
    je input
    int 0x10
    inc bx
    jmp loop
input:
    mov ax, 0
    int 0x16
    mov ah, 0x0e
    int 0x10

    cmp al, 8
    jne input
    mov al, 32
    int 0x10
    mov al, 8
    int 0x10
    jmp input
end:
    jmp $

str:
    db "Hello World! (OS)", 0xA,0xD,0

times 510-($-$$) db 0 
db 0x55, 0xaa

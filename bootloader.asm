mov ah, 0x0e

mov al, 'A'
int 0x10

mov al, 'h'
int 0x10

mov al, 'o'
int 0x10

mov al, 'j'
int 0x10

mov al, ' '
int 0x10

mov al, 's'
int 0x10

mov al, 'v'
int 0x10

mov al, 'e'
int 0x10

mov al, 't'
int 0x10

mov al, 'e'
int 0x10

mov al, '.'
int 0x10

times 510 - ($-$$) db 0
dw 0xaa55

[org 0x7C00]

[bits 16]

mov bp, 0x0500
mov sp, bp

mov byte[boot_drive], dl



mov bx, 0x0002
mov cx, 0x0001
mov dx, 0x7E00

call load_bios
call elevate_bios

bootsector_hold:
jmp $

%include "real_mode/load.asm"
%include "real_mode/gdt.asm"
%include "real_mode/elevate.asm"

boot_drive:                     db 0x00


begin_protected:

[bits 32]

call detect_lm_protected
call init_pt_protected
call elevate_protected

jmp $

%include "protected_mode/detect_lm.asm"
%include "protected_mode/init_pt.asm"
%include "protected_mode/gdt.asm"
%include "protected_mode/elevate.asm"

begin_long_mode:

[bits 64]

call kernel_start
jmp $

kernel_start: equ 0x7e00

times 510 - ($-$$) db 0
dw 0xaa55

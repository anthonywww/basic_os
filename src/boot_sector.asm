; Boot Sector

; Boot Sector is located at 0x7C00, so instead of shifting all bytes
; over manually, the ORG command will automatically do that globally.
[org 0x7c00]

;; Enable TTY mode
mov ah, 0x0e

call cls
mov bx, SAY_HI
call print
call print_nl

; Set AL to point at label "the_secret"
; (prints 'X')
mov al, [the_secret]
int 0x10

; Jump to current address = infinate loop
jmp $

; remember to include subroutines below the hang
%include "boot_sector_print.asm"
%include "boot_sector_print_hex.asm"



SAY_HI:
	db 'Hello World!', 0


the_secret:
	; ASCII code 0x58 ('X') is stored just before the zero-padding.
	; On this code that is at byte 0x16 (check by using xxd file.bin)
	db 'X'

; Zero padding and magic BIOS number
times 510 - ($-$$) db 0
dw 0xaa55

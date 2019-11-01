
;; Print HELLO
;mov al, 'H'
;int 0x10
;mov al, 'e'
;int 0x10
;mov al, 'l'
;int 0x10
;int 0x10 ; 'l' is still on al, remember?
;mov al, 'o'
;int 0x10
;mov al, ' '
;int 0x10


; Clear Screen
cls:
	mov ah, 0x00      ; Set video mode
	mov al, 03h       ; Mode 3 (Color text)
	int 0x10
	;mov dx, 0 ; Set cursor to top left-most corner of screen
	;mov bh, 0
	;mov ah, 0x2
	;int 0x10
	;mov cx, 2000 ; print 2000 chars
	;mov bh, 0
	;mov bl, 0x21 ; green bg/blue fg
	;mov al, 0x20 ; blank char
	;mov ah, 0x9
	;int 0x10
	mov ax, 0600h        ; AH=06(scroll up window), AL=00(entire window)
	mov bh, 00010111b    ; left nibble for background (blue), right nibble for foreground (light gray)
	mov cx, 0000h        ; CH=00(top), CL=00(left)
	mov dx, 1010h        ; DH=19(bottom), DL=50(right)
	int 10h
	mov ah, 0x0e
	ret


print:
	pusha

; keep this in mind:
; while (string[i] != 0) { print string[i]; i++ }

; the comparison for string end (null byte)
start:
	mov al, [bx] ; 'bx' is the base address for the string
	cmp al, 0
	je done

	; the part where we print with the BIOS help
	mov ah, 0x0e
	int 0x10 ; 'al' already contains the char

	; increment pointer and do next loop
	add bx, 1
	jmp start

done:
	popa
	ret

print_nl:
	pusha

	mov ah, 0x0e
	mov al, 0x0a ; newline char
	int 0x10
	mov al, 0x0d ; carriage return
	int 0x10

	popa
	ret

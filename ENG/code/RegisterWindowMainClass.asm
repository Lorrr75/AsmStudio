.686

.code

;
; This function creates a base class for creating the window
;
RegisterWindowMainClass	proc
local	wc:WNDCLASSEX						; creates local variables on the stack
local	msg:MSG

	; fills the class structure with the data
	mov	wc.cbSize, SIZEOF WNDCLASSEX		
								; Of the size of the structure in bytes
	mov	wc.style, CS_HREDRAW or CS_VREDRAW		; window style
	mov	wc.lpfnWndProc, OFFSET MainWndProc		; Offset of the window message management function
	mov	wc.cbClsExtra, NULL				; to NULL for win32 or greater
	mov	wc.cbWndExtra, NULL				; to NULL for win32 or greater
	push	hInstance					; uses the stack to move hInstance into the structure
	pop	wc.hInstance
	mov	wc.hbrBackground, COLOR_WINDOW+1		; window background color
	mov	wc.lpszMenuName, offset szMainMenu		; name of the Menu that appears at the top of the window
	mov	wc.lpszClassName, OFFSET szMainClassName	; name of the class to be registered
	invoke 	LoadIcon, NULL, IDI_APPLICATION			; standard window icon
	mov	wc.hIcon, eax					; normal icon
	mov	wc.hIconSm, eax					; small icon
	invoke	LoadCursor, NULL, IDC_ARROW			; load standard mouse cursor icon
	mov	wc.hCursor, eax

	invoke	RegisterClassEx, addr wc			; does the registration of the window class

	ret
RegisterWindowMainClass	endp
.686

.code

;
; Questa funzione crea una classe base per la creazione della finestra
;
RegisterWindowMainClass	proc
comment §
local	wc:WNDCLASSEX					;crea variabili locali sullo stack
local	msg:MSG

	mov	wc.cbSize, SIZEOF WNDCLASSEX		;riempe la struttura della classe con i dati
	mov	wc.style, CS_HREDRAW or CS_VREDRAW
	mov	wc.lpfnWndProc, OFFSET MainWndProc
	mov	wc.cbClsExtra, NULL
	mov	wc.cbWndExtra, NULL
	push	hInstance
	pop	wc.hInstance
	mov	wc.hbrBackground, COLOR_WINDOW+1
	mov	wc.lpszMenuName, MainMenu
	mov	wc.lpszClassName, OFFSET szMainClassName
	invoke 	LoadIcon, NULL, IDI_APPLICATION
	mov	wc.hIcon, eax
	mov	wc.hIconSm, eax
	invoke	LoadCursor, NULL, IDC_ARROW
	mov	wc.hCursor, eax

	invoke	RegisterClassEx, addr wc
§
	ret
RegisterWindowMainClass	endp
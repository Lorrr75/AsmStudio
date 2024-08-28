.386

include c:\masm32\include\windows.inc

.code

;
; Crea componente Tab per la finestra di editor
;
; input:	hWnd - handle della finestra dove installare il componente
;		rect - dimensioni del componente da creare
;
; Restituisce 0 in caso d'errore
;
TabCreate proc hwnd:HWND, rect:RECT
local	icex:INITCOMMONCONTROLSEX 
	
	mov	icex.dwSize, sizeof INITCOMMONCONTROLSEX
	mov	icex.dwICC, 8h

	invoke	InitCommonControlsEx, ADDR icex

	invoke	CreateWindowEx, NULL, offset WC_TABCONTROL, NULL, WS_CHILD or WS_CLIPSIBLINGS or WS_VISIBLE, rect.left, rect.top, 300, 200, hwnd, NULL, NULL, NULL

	ret
TabCreate endp

.data
iItem 	dd -1

.code

AddTab	proc htab:HWND, sztitle:DWORD
local	tie:TCITEM

	mov	ecx, iItem
	inc	ecx
	mov	iItem, ecx

	mov	tie.imask, TCIF_TEXT
	mov	eax, sztitle
	mov	tie.pszText, eax

	invoke 	SendMessage, htab, 1307h, iItem, addr tie
	
	ret
AddTab	endp
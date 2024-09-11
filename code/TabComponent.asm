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

	invoke	CreateWindowEx, NULL, offset WC_TABCONTROL, NULL, WS_CHILD or WS_CLIPSIBLINGS or WS_VISIBLE, rect.left, rect.top, 300, 200, hwnd, NULL, hInstance, NULL

	ret
TabCreate endp

.data

iItem 	dd -1		; usiamo questa variabile come contatore di tab. Ad ogni aggiunta, sottraiamo 1 (da controllare che sia corretto altrimenti usare un array...)

.code

;
; Questa procedura consente di aggiungere un tab al componente tab
; Input:	hTab - hwnd del componente tab a cui aggiungere il nuovo tab
;		szTitle - stringa con il titolo del tab (in questo programma il nome del file)

AddTab	proc htab:HWND, sztitle:DWORD
local	tie:TCITEM
local	hEdit:HWND

	mov	ecx, iItem
	inc	ecx
	mov	iItem, ecx

	mov	tie.imask, TCIF_TEXT
	mov	eax, sztitle
	mov	tie.pszText, eax

	invoke 	SendMessage, htab, 1307h, iItem, addr tie

	invoke	CreateWindowEx, NULL, offset WC_TABCONTROL, NULL, WS_CHILD or WS_VISIBLE or WS_BORDER or ES_MULTILINE, 20, 40, 260, 150, htab, NULL, hInstance, NULL
	mov	hEdit, eax
	invoke	ShowWindow, hEdit, SW_SHOW
	
	ret
AddTab	endp

RemoveTab	proc htab:HWND, index
	ret
RemoveTab	endp
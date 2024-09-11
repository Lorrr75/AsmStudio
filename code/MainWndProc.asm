.686

.code

;
; Funzione di gestione dei messaggi che provengono da windows
;
MainWndProc proc hWnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM
local	hdc:HDC
local	ps:PAINTSTRUCT
local	rect:RECT

	.IF uMsg == WM_DESTROY
		invoke PostQuitMessage, NULL

	.ELSEIF uMsg == WM_CREATE
		mov	rect.left, 0
		mov	rect.top, 0
		mov	rect.right, 300
		mov	rect.bottom, 200		
		invoke	TabCreate, hWnd, rect
		mov	hTab, eax
		lea	eax, szTitle
		invoke	 AddTab, hTab, eax

	.ELSEIF uMsg == WM_PAINT
		xor	eax, eax
		mov 	ecx, [eax].NMHDR.hwndFrom

;		cmp 	ecx, hTab
 ;   		jne	noTab
;    		mov edx, [eax].NMHDR.code    	
;    		cmp edx, 0fffffde7h	;TCN_SELCHANGE = TTN_FIRST (0fffffde8h - 1)
;		jne	noTab

;		invoke 	SendMessage, htab, 1311h, 0, 0

		

noTab:
	.ELSEIF uMsg == WM_NOTIFY
		mov	eax, lParam
		
	.ELSE
		invoke DefWindowProc, hWnd, uMsg, wParam, lParam
		ret
	.ENDIF

	xor	eax, eax
	ret
MainWndProc	endp
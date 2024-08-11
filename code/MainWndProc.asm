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

	.ELSEIF uMsg == WM_PAINT
		xor	eax, eax
		ret
	.ELSE
		invoke DefWindowProc, hWnd, uMsg, wParam, lParam
		ret
	.ENDIF

	xor	eax, eax
	ret
MainWndProc	endp
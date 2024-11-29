.686

NR 	struct
  hwndFrom	DW ?
  idFrom	DW ?
  code		DW ?
NR	ends

.data?
sTab	DW ?

.code

;
; Function to handle messages that come from windows
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

		invoke 	SendMessage, hTab, 1311h, 0, 0
		ret
		
	.ELSEIF uMsg == WM_NOTIFY
		; not working
		mov	eax, lParam
		push	eax
		pop	sTab		

		mov	eax, DWORD PTR [sTab+8]
		cmp	eax, TCN_SELCHANGE
		jne	NO_TAB_NOTIFY

		invoke SendMessage, hTab, TCM_GETCURSEL, 0, 0

NO_TAB_NOTIFY:
		ret

	.ELSEIF uMsg == WM_COMMAND
		invoke	HandleMenu, wParam
		
	.ELSE
		invoke DefWindowProc, hWnd, uMsg, wParam, lParam
		ret
	.ENDIF

	xor	eax, eax
	ret
MainWndProc	endp
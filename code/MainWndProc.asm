.686

.code

;
; Funzione di callback per la gestione dei messaggi nella finestra principale
;
MainWndProc proc hWnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM


	; obbligatoriamente nella programmazione di Windows bisogna chiamare
	; DefWindowProc ogni volta che non vogliamo gestire un messaggio
	invoke	DefWindowProc, hWnd, uMsg, wParam, lParam
	ret
MainWndProc endp
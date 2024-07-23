.code

;
; programma di inzizializzazione, ciclo principale, pulizia dati e uscita
;
WinMain proc hInst:DWORD, hPrevInst:DWORD, szCmdLine:DWORD, nCmdShow:DWORD

	; chiama la registrazione della classe della finestra principale
	invoke	RegisterWindowMainClass
	
	; sopraggiunti errori durante la registrazione?
	cmp	eax, 0
	jne	RegisterWindowMainClass_OK
	; si, segnaliamo errore
	lea	eax, szErrorRegisterWindowMainClass
	jmp	WinMain_Error

	; no, continuiamo con il programma
RegisterWindowMainClass_OK:




WinMain_Exit:
	ret

WinMain_Error:
	; quando siamo qui, in eax c'è l'offset del messggio da inserire nella MessageBox e poi prosegue all'uscita
	invoke	MessageBox, NULL, eax, offset szCaptionError, MB_OK
	mov	eax, -1				; restituiamo mettiamo messaggio d'errore "massimo"

	; dopo aver preso visione del messaggio d'errore irreversibile usciamo dal programma
	jmp	WinMain_Exit
WinMain endp
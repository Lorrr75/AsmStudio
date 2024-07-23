.686

.code

;
; Questa funzione crea una classe base per la creazione della finestra
;
RegisterWindowMainClass	proc
local	wc:WNDCLASSEX						;crea variabili locali sullo stack
local	msg:MSG

	;riempe la struttura della classe con i dati
	mov	wc.cbSize, SIZEOF WNDCLASSEX			; per tutte le strutture terminanti in EX necessitano l'inserimento
								; della dimensione della struttura in byte
	mov	wc.style, CS_HREDRAW or CS_VREDRAW		; stile della finestra
	mov	wc.lpfnWndProc, OFFSET MainWndProc		; offset della funzione di gestioni dei messaggi della finestra
	mov	wc.cbClsExtra, NULL				; a NULL per win32 e superirori
	mov	wc.cbWndExtra, NULL				; a NULL per win32 e superirori
	push	hInstance					; usa lo stack per spostare hInstance nella struttura
	pop	wc.hInstance
	mov	wc.hbrBackground, COLOR_WINDOW+1		; colore dello sfondo della finestra
	mov	wc.lpszMenuName, offset szMainMenu		; nome del Menu che compare in cima alla finestra
	mov	wc.lpszClassName, OFFSET szMainClassName	; nome della classe da registrare
	invoke 	LoadIcon, NULL, IDI_APPLICATION			; icona della finestra standard
	mov	wc.hIcon, eax					; normale
	mov	wc.hIconSm, eax					; piccola
	invoke	LoadCursor, NULL, IDC_ARROW			; carica icona cursore mouse standard
	mov	wc.hCursor, eax

	invoke	RegisterClassEx, addr wc			; fa la registrazione della classe della finestra

	ret
RegisterWindowMainClass	endp
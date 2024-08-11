.686

.const

.data

szMainClassName 			db "LR_VisAsm",0		; Nome della classe finestra principale
szAppName				db "Visual Asm",0		; Nome dell'applicazione
szMainMenu				db NULL				; Nome del menu nella finestra principale la risorsa si trova nel file res.rc

OurText	  db "Assembly Win32 è grande e facile!",0


;
; Messaggi di Attenzione per Message Box
;
szCaptionWarning			db "ATTENZIONE",0


;
; Messaggi di errore per Message Box
;
szCaptionError				db "ERRORE",0			; titolo della Message Box
szErrorRegisterWindowMainClass		db "Impossibile registrare la classe della finestra.", 0ah, 0dh, "Programma terminato",0
szErrorCreateWindow			db "Impossibile creare la finesta.", 0ah, 0dh, "Programma terminato",0
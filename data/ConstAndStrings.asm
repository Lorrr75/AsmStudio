.686

.const

IDM_FILE_NEW	equ 1

.data

szMainClassName 			db "LR_VisAsm",0		; Nome della classe finestra principale
szAppName				db "Visual Asm",0		; Nome dell'applicazione
szMainMenu				db "MainMenu",0			; Nome del menu nella finestra principale la risorsa si trova nel file res.rc
WC_TABCONTROL				db "SysTabControl32",0		; nome del controllo Tab (se cambio il nome il controllo non funziona)
szTitle					db "FileTest.asm",0		; test nome del tab
compEdit				db "Edit",0			; test per la creazione dell'editor deltro il tab

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
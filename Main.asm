.686

.model	flat, stdcall
option casemap:none

;
; sezione inclusione codice sorgente e "creare un unico file" da compilare
;
include	include\CommonHeader.inc	; Qui ci saranno gli header che serviranno
include include\CommonLib.inc		; Qui ci sono le librerie da importare
include include\Proto.inc		; Qui inseriremo i prototipi di funzioni
include data\ConstAndStrings.asm 	; Qui ci saranno le costanti (i tipi EQU ecc) e le stringhe con nomi ed messaggi
				 	; d'errore che non saranno modificate
include data\Handle.asm			; Qui ci saranno tutte le veariabili HANDLE ? e HWND ? ecc.ecc., non inizializzati
					; per la gestione delle finestre
include data\Buffer.asm			; Qui ci saranno tutti buffer
include data\PointerData.asm		; Qui ci saranno tutti i puntatori non inizizializzati col '?'
					; Qui ci c'è tanto spazio per aggiungere altri file da includere

				
.code

; punto d'ingresso del programma
main:

	invoke	GetModuleHandle, NULL		; ottiene l'handle del programma 
	mov	hInstance, eax			; memorizziamo l'handle per sicurezza

	invoke	GetCommandLine			; ottiene la linea di comando. se il tuo programma non processa
	mov	CommandLine, eax		; la linea di comando puoi cancellare queste 2 linee

	
	; come per il c++ chiamaiamo il WinMain come corpo del programma principale
	invoke 	WinMain, hInstance, NULL, ADDR CommandLine, SW_SHOWNORMAL

	; programma terminato con successo, restituisce il controllo a Windows
	invoke	ExitProcess, 0

; alleghiamo altri file sorgente per la compilazione

include code\WinMain.asm			; corpo principale del programma
include code\MainWndProc.asm			; funzione callback gestione messaggi finestra principale
include code\RegisterWindowMainClass.asm	; funzione registrazione classe della finestra
include code\InitIde.asm			; funzione di inizializzazione 
include code\DeInitIde.asm			; funzione di cancellazione dai inizializzati



; qui indichiamo la fine del file con il punto d'ingresso del programma
end	main
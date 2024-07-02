.686

.model	flat, stdcall
option casemap:none


include	CommonHeader.asm	; Qui ci saranno gli header che serviranno
include CommonLib.asm		; Qui ci sono le librerie da importare
include Proto.asm		; Qui inseriremo i prototipi di funzioni
include data\Const.asm		; Qui ci saranno le costanti (i tipi EQU ecc)
include data\Handle.asm		; Qui ci saranno tutte le veariabili HANDLE ? per la gestione delle finestre
include data\string.asm		; Qui ci saranno tutte le stringhe e messaggi d'errore
				; Qui ci c'è tanto spazio per aggiungere altri file da includere

				
.code

; punto d'ingresso del programma
main:


	; programma terminato, restituisce il controllo a Windows
	invoke	ExitProcess, 0

; alleghiamo altri file sorgente per la compilazione

include code\WinMain.asm
include code\MainWndProc.asm

; qui indichiamo il punto d'ingresso del programma
end	main
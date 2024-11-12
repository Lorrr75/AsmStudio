.686

.model	flat, stdcall
option casemap:none

;
; source code inclusion section and ‘create a single file’ to compile
;
include	include\CommonHeader.inc			; Here will be the headers
include include\CommonLib.inc				; Here are the libraries to import
include include\Proto.inc				; Here we will insert function prototypes

include data\ConstAndStrings.asm 			;Here will be constants (EQU types etc.) and strings with names and messages
				 			; of errors that will not be modified
include data\Handle.asm					;Here will be all the veariables HANDLE ? and HWND ? etc., uninitalised
						        ; for window management
include data\PointerData.asm				; Here will be all uninitialised pointers with '?'.
					
;There is plenty of room here for more files to be included

.code

; entry point of the programm
main:

	invoke	GetModuleHandle, NULL		; obtains the programm handle 
	mov	hInstance, eax			; we store the handle for safety

	invoke	GetCommandLine			; gets the command line. if your programme does not process
	mov	CommandLine, eax		; the command line you can delete these 2 lines

	
	; as with c++ we call the WinMain as the body of the main programm
	invoke 	WinMain, hInstance, NULL, ADDR CommandLine, SW_SHOWNORMAL

	; programm terminated with result eax, returns control to Windows
	invoke	ExitProcess, eax

; attach additional source files for compilation

include code\WinMain.asm			; main body of the programme
include code\MainWndProc.asm			; callback function handling messages main window
include code\RegisterWindowMainClass.asm	; window class registration function
include code\InitIde.asm			; funzione di inizializzazione 
include code\DeInitIde.asm			; delete function from initialised
include code\TabComponent.asm			; functions for creating the Tab component
include code\Menu.asm				; menu management functions

; here we indicate the end of the file with the entry point of the programm
end	main